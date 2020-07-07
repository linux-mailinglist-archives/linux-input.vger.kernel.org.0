Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC650216A94
	for <lists+linux-input@lfdr.de>; Tue,  7 Jul 2020 12:41:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbgGGKlC (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Jul 2020 06:41:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:55432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726467AbgGGKlC (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Jul 2020 06:41:02 -0400
Received: from pobox.suse.cz (nat1.prg.suse.com [195.250.132.148])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 289102064C;
        Tue,  7 Jul 2020 10:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594118462;
        bh=b0lxYJ9lP6g69W79rfSf6hh9ZzB1DotCO31lEeMmK4A=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=uZHILEBdfEtmn83GvooIUDxkeaVWBALM8fPvlKJcmKeanUBqJ87RXrfyfc6lM04Wl
         pQMn3D3oPZ7vrfwmWKuuiSSUsfwD0p7Io3iL6N5htJitN0dlggSM8DH1IiMnM2YNVP
         +qizjbDc8TN2BmtwzTmxzPkyXnE2ag6wiN3x5qwg=
Date:   Tue, 7 Jul 2020 12:40:59 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>,
        Peter Hutterer <peter.hutterer@who-t.net>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: logitech-hidpp: avoid repeated "multiplier = " log
 messages
In-Reply-To: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
Message-ID: <nycvar.YFH.7.76.2007071240480.15962@cbobk.fhfr.pm>
References: <7d2c980f071487cecfd1534adb7561b33d922af3.1593970340.git.mail@maciej.szmigiero.name>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sun, 5 Jul 2020, Maciej S. Szmigiero wrote:

> These messages appear each time the mouse wakes from sleep, in my case
> (Logitech M705), every minute or so.
> Let's downgrade them to the "debug" level so they don't fill the kernel log
> by default.
> 
> While we are at it, let's make clear that this is a wheel multiplier (and
> not, for example, XY movement multiplier).
> 
> Fixes: 4435ff2f09a2 ("HID: logitech: Enable high-resolution scrolling on Logitech mice")
> Cc: stable@vger.kernel.org
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>

Applied, thank you Maciej.

-- 
Jiri Kosina
SUSE Labs

