Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F945373B3D
	for <lists+linux-input@lfdr.de>; Wed,  5 May 2021 14:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232199AbhEEMcR (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 5 May 2021 08:32:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:38822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhEEMcQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Wed, 5 May 2021 08:32:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71FBA613B3;
        Wed,  5 May 2021 12:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620217880;
        bh=rFmmXrPI4X+4npjqbU6ZVuXEOQcIcF/NgfprbwXQt68=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=LXMr/y/ULkX039TONXqOhGulmtKi2XzV3VGVnxW10XGsuzOqFka4WThN6G3cmuhJV
         PeGeDi0i87CeIl4FkbF9wZuRhDjKP274GCkKjvR1o++B3oRiu0uCX7Xh9zRtCArLdY
         rbCykPy63d8PIAfLy1KwyWvCzdZ3IOwHqD+9yhGZ4SwMuQ+Ti8Kiy7NAuHdeK7HIoR
         4y41jkgbZ239KO/9wphSS+exxmGCNLswYJ+ocZpltWFVH4RFjMHSmHLM0VI0rokJ6n
         dgWGhbOiuqeWB56BdFN9O9JAdi54mB1plT8BiKOY//hO102RMS22XN/KwdvB2aenee
         0sev3ECDENAsQ==
Date:   Wed, 5 May 2021 14:31:17 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: hid-input: add mapping for emoji picker key
In-Reply-To: <20210411025606.2744875-1-dmitry.torokhov@gmail.com>
Message-ID: <nycvar.YFH.7.76.2105051431080.28378@cbobk.fhfr.pm>
References: <20210411025606.2744875-1-dmitry.torokhov@gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 10 Apr 2021, Dmitry Torokhov wrote:

> HUTRR101 added a new usage code for a key that is supposed to invoke and
> dismiss an emoji picker widget to assist users to locate and enter emojis.
> 
> This patch adds a new key definition KEY_EMOJI_PICKER and maps 0x0c/0x0d9
> usage code to this new keycode. Additionally hid-debug is adjusted to
> recognize this new usage code as well.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Both paches applied, thanks Dmitry.

-- 
Jiri Kosina
SUSE Labs

