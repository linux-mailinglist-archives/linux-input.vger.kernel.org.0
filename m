Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24A612EF20E
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 13:11:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhAHMLb (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 07:11:31 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:45690 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725836AbhAHMLb (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Fri, 8 Jan 2021 07:11:31 -0500
Received: from relay13.mail.gandi.net (unknown [217.70.178.233])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 143BB3C1068
        for <linux-input@vger.kernel.org>; Fri,  8 Jan 2021 11:43:21 +0000 (UTC)
Received: from [192.168.1.150] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay13.mail.gandi.net (Postfix) with ESMTPSA id A57038000C;
        Fri,  8 Jan 2021 11:42:19 +0000 (UTC)
Message-ID: <66a19853e1d9e3c0a404c7a65adc6fff6b177fb9.camel@hadess.net>
Subject: Re: Logitech M705 mouse not disappearing when turned off
From:   Bastien Nocera <hadess@hadess.net>
To:     linux-input@vger.kernel.org
Cc:     Filipe =?ISO-8859-1?Q?La=EDns?= <lains@archlinux.org>
Date:   Fri, 08 Jan 2021 12:42:19 +0100
In-Reply-To: <c680fafd0d67bdca6ee114e542a0af99828acb83.camel@hadess.net>
References: <c680fafd0d67bdca6ee114e542a0af99828acb83.camel@hadess.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 (3.38.2-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, 2021-01-08 at 12:23 +0100, Bastien Nocera wrote:
> Hey,
> 
> I have recently bought a Logitech Marathon Mouse/Performance Plus
> M705,
> and I ended up with 2 power_supply class batteries for it when it was
> turned off already when using kernel 5.9.13.
> 
> Using a newer kernel (5.11-rc2), the power_supply class device
> doesn't
> disappear either:
> <snip>
> I'll look into the upower problem soon.

Filed as:
https://gitlab.freedesktop.org/upower/upower/-/issues/134

