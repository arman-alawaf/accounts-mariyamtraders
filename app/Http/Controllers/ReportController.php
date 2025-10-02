<?php

namespace App\Http\Controllers;

use App\Models\Buy;
use App\Models\Sell;
use Illuminate\Http\Request;
use Carbon\Carbon;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $filter = $request->get('filter', 'daily');
        $startDate = $request->get('start_date');
        $endDate = $request->get('end_date');

        $query = $this->getDateQuery($filter, $startDate, $endDate);

        $buys = Buy::with('supplier', 'buyItems.product', 'buyItems.unit')
            ->whereBetween('created_at', [$query['start'], $query['end']])
            ->get();

        $sells = Sell::with('customer', 'sellItems.product', 'sellItems.unit')
            ->whereBetween('created_at', [$query['start'], $query['end']])
            ->get();

        $buyTotal = $buys->sum(function ($buy) {
            return $buy->buyItems->sum(function ($item) {
                return $item->amount * $item->quantity;
            });
        });

        $sellTotal = $sells->sum(function ($sell) {
            return $sell->sellItems->sum(function ($item) {
                return $item->amount * $item->quantity;
            });
        });

        $netProfit = $sellTotal - $buyTotal;

        return view('admin.reports.index', compact('buys', 'sells', 'buyTotal', 'sellTotal', 'netProfit', 'filter', 'startDate', 'endDate'));
    }

    private function getDateQuery($filter, $startDate, $endDate)
    {
        $now = Carbon::now();

        switch ($filter) {
            case 'daily':
                return [
                    'start' => $now->startOfDay(),
                    'end' => $now->endOfDay()
                ];
            case 'weekly':
                return [
                    'start' => $now->startOfWeek(),
                    'end' => $now->endOfWeek()
                ];
            case 'monthly':
                return [
                    'start' => $now->startOfMonth(),
                    'end' => $now->endOfMonth()
                ];
            case 'yearly':
                return [
                    'start' => $now->startOfYear(),
                    'end' => $now->endOfYear()
                ];
            case 'datewise':
                if ($startDate && $endDate) {
                    return [
                        'start' => Carbon::parse($startDate)->startOfDay(),
                        'end' => Carbon::parse($endDate)->endOfDay()
                    ];
                }
                // Default to today if no dates
                return [
                    'start' => $now->startOfDay(),
                    'end' => $now->endOfDay()
                ];
            default:
                return [
                    'start' => $now->startOfDay(),
                    'end' => $now->endOfDay()
                ];
        }
    }
}
