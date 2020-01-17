Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A2C140A83
	for <lists+linux-input@lfdr.de>; Fri, 17 Jan 2020 14:16:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgAQNPV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 17 Jan 2020 08:15:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:49144 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgAQNPU (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 17 Jan 2020 08:15:20 -0500
Received: from pobox.suse.cz (prg-ext-pat.suse.com [213.151.95.130])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDB47206E6;
        Fri, 17 Jan 2020 13:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579266920;
        bh=zaP9yizmiuvwNNG5Zzz7I54DVht4AVUQr7B3YHhQhvY=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=GvdNBvh/T0nHxe8KMwioOUgWdQkhuEaSChFVAuWAJ5WHWldM4jwAl/dbh1icu3Kem
         ThS7YejBGzsLuGlCKXj8RexSkqq2VVn0j3bl9dkY4sIrbhxMNtYh4lqxM2U4SzFBWN
         sXtwUcSTkNEWrHKC9hs78oaO1aKDPDbVEZgeL/d4=
Date:   Fri, 17 Jan 2020 14:15:17 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Pavel Balan <admin@kryma.net>
cc:     linux-input@vger.kernel.org
Subject: Re: Hotkey activation of a HID function
In-Reply-To: <a6de4f52-414e-2ffb-26f9-5b7211c55a91@kryma.net>
Message-ID: <nycvar.YFH.7.76.2001171412420.31058@cbobk.fhfr.pm>
References: <a6de4f52-414e-2ffb-26f9-5b7211c55a91@kryma.net>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 30 Dec 2019, Pavel Balan wrote:

> I am currently in the process of writing a driver for a laptop backlight
> peripheral. It takes a HID feature request to activate - and according to the
> way it works in Windows (thanks to pre-installed software packages), the
> driver activates it on receiving a hot-key combination.
> 
> Is there a paved, proper way to implement that functionality - provided the
> built-in keyboard and the backlight are two separate devices?

Hi Pavel,

just to make sure I understand your question correctly -- you would like 
to know how to cleanly implement this scenario: once some special hotkey 
is pressed (is that a HID device? What usage / code mapping does the 
hotkey press produce?), create a HID report and send it to the device.

Correct?

It really depends whether that hotkey is something standard, or something 
vendor-specific.

Thanks,

-- 
Jiri Kosina
SUSE Labs

