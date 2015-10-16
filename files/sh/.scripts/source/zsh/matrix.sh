#!/bin/zsh

matrix() {
  tmux set -g status
  cmatrix
  tmux set -g status
}
