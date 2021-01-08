Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC50B2EF324
	for <lists+linux-input@lfdr.de>; Fri,  8 Jan 2021 14:36:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbhAHNgY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Fri, 8 Jan 2021 08:36:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:37292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726060AbhAHNgY (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Fri, 8 Jan 2021 08:36:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 34A9923998;
        Fri,  8 Jan 2021 13:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610112943;
        bh=6xKInCD0XJ7fZUFJsDTLg+852XRKb0NnGLUbi6vsFTI=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=Y9CBsSHbXMx4G/GUly+7ECb0uyh1+RPC9Q2HFNPVQK/GErC/kEIsI2aooewL/JcP5
         Hf2bN18NLU6JjAbydNhz8hXIoV7iC2pFUQ0QL4IxYJDu9GdNyNWcCt6Px8l7DvHwcv
         QbweRU8BNxUTqcZfcObrPiTRaRudZNnVAs1NfavebCJVofTB7QYGwtFEB6qR6KHgpU
         V5UCX9idhxZPfr8JR28Y3PAGg5fdTOGLcBr+t5D6wvmh1dY8shxSxF/yBzAT2gF2BM
         RFyDRRwW6ZGxBrKk3IR0vso9lXLJqxVA5qrSPqgGnBTq9j5XwG6USALYow9MbIR+E/
         BEG/R5appBTGQ==
Date:   Fri, 8 Jan 2021 14:35:40 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
cc:     linux-input@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Paul Hollinsky <phollinsky@holtechnik.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Input: gtco - remove driver
In-Reply-To: <X9xR/wTjU1tLS5JV@google.com>
Message-ID: <nycvar.YFH.7.76.2101081434550.13752@cbobk.fhfr.pm>
References: <X8wbBtO5KidME17K@google.com> <nycvar.YFH.7.76.2012171221350.25826@cbobk.fhfr.pm> <X9xR/wTjU1tLS5JV@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Thu, 17 Dec 2020, Dmitry Torokhov wrote:

> > > Note that our HID support has greatly improved over the last 10 years,
> > > we may also consider reverting 6f8d9e26e7de ("hid-core.c: Adds all GTCO
> > > CalComp Digitizers and InterWrite School Products to blacklist") and see
> > > if GTCO devices actually work with normal HID drivers.
> > 
> > Sounds like a good plan to me. Perhaps you can do that in a series 
> > together, and stage that for 5.12?
> 
> Sorry, I already zapped the driver in 5.11.
> 
> Unfortunately I do not have this hardware, so while we could remove
> these devices from the blacklist we will have to do that blindly. Please
> let me know if you still want to do that.

We can also wait for the first person to potentially complain (if ever) 
about the driver going away -- that'd mean that the person does actually 
still have that hardware, and we could ask him to test with hid-generic.

Thanks,

-- 
Jiri Kosina
SUSE Labs

