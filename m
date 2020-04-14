Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D386F1A772A
	for <lists+linux-input@lfdr.de>; Tue, 14 Apr 2020 11:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437501AbgDNJQN (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 14 Apr 2020 05:16:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59936 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437524AbgDNJQL (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 14 Apr 2020 05:16:11 -0400
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE03B206E9;
        Tue, 14 Apr 2020 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586855770;
        bh=oD7tlr8u6fqKNKPrS8l7PqUF+MJIOfR9lZAO6livEj8=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=R2SwY2YXN7wOXtS1iO0/PBTpK8w7n82D+4tq/Hb4vDEmGq/zR/VrUX7WGZgC79Zrx
         z0thlCHM+fC4aw7O6vi4ZZc5q7dP54cYSTdGs1Cu1I18Wn3FJng/WV6M+3EvzyP6kh
         BVvgwMbOCbED63qwGPts/TrCjH27YuKE0v5qMRpc=
Date:   Tue, 14 Apr 2020 11:16:07 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Fabian Schindlatz <fabian.schindlatz@fau.de>
cc:     Hans de Goede <hdegoede@redhat.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org
Subject: Re: [PATCH] HID: Add support for Logitech G11 extra keys
In-Reply-To: <20200413164628.38283-1-fabian.schindlatz@fau.de>
Message-ID: <nycvar.YFH.7.76.2004141115580.19713@cbobk.fhfr.pm>
References: <20200413164628.38283-1-fabian.schindlatz@fau.de>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 13 Apr 2020, Fabian Schindlatz wrote:

> The Logitech G11 keyboard is a cheap variant of the G15 without the LCD
> screen. It uses the same layout for its extra and macro keys (G1 - G18,
> M1-M3, MR) and - from the input subsystem's perspective - behaves just
> like the G15, so we can treat it as such.
> 
> Tested it with my own keyboard.
> 
> Signed-off-by: Fabian Schindlatz <fabian.schindlatz@fau.de>

Applied, thanks.

-- 
Jiri Kosina
SUSE Labs

