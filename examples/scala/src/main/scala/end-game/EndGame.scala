package com.decaf.algorithms.endgame

case class Items[T](head: T, middle: Seq[T], last: T) {
  def isEmpty = middle.isEmpty
}

trait Strategy[T] {
  def score: T
  def takeTurn(game: Items[T]): Items[T]
}

trait Game[T] {
  def players: Seq[Strategy[T]]

  @annotation.tailrec
  final def play(players: List[Strategy[T]], state: Items[T]): Game[T] = {
    if (players.isEmpty) return this

    // Then there is a head/tail pair
    if (numbers.isEmpty) players.map(_.takeTurn(numbers))
    else play(players, items)
  }

  final def playAndCalculate(state: Items[T]): Strategy[T] =
    play(players, state).players.maxBy(_.score)
}

//trait RandomStrategy[T] extends Strategy
