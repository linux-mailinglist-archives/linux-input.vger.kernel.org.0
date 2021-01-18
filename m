Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA512F9B06
	for <lists+linux-input@lfdr.de>; Mon, 18 Jan 2021 09:12:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733310AbhARIM3 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 18 Jan 2021 03:12:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:34566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733285AbhARIM0 (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Mon, 18 Jan 2021 03:12:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4BAE522525;
        Mon, 18 Jan 2021 08:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610957505;
        bh=yNKru1sDuhSyEYa/wM0c0HWM2DKIkqg54IAtfl2K+No=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=rp6Fqj+OPqaI0p5gkxm1wPWbonveHWN5IbTinF88zFmecsVWL/OWi+Pe0WPT9TLl7
         mdd71YyNzwZ86XrhN7esrOfKKNPueEv33fjAYzw9K4EbCeserKsiERZKJWmx2g2KL7
         nitSEGEL5KjKJ89P0EreJcOJELEv3ffsf9X6zskEQPwYFzwW27D0Y30gb3uvvkjA9I
         qFch24gYouJYERTMYZk8U0GXwG4ZyTSptvkdjcZiXK+uv0mGNrx3vvJCUl7tlbVYzj
         14Y2kqeapwfltMSTzFl+jEl0D41KrWHMhzTYmw69vWZhkyDhnlnnXhSAksoR2kxj6l
         dXoV0yLn+SksA==
Date:   Mon, 18 Jan 2021 09:11:33 +0100 (CET)
From:   Jiri Kosina <jikos@kernel.org>
To:     Will McVicker <willmcvicker@google.com>
cc:     Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        security@kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-team@android.com,
        Will Coster <willcoster@google.com>
Subject: Re: [PATCH v1] HID: make arrays usage and value to be the same
In-Reply-To: <20201205004848.2541215-1-willmcvicker@google.com>
Message-ID: <nycvar.YFH.7.76.2101180911150.5622@cbobk.fhfr.pm>
References: <20201205004848.2541215-1-willmcvicker@google.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Sat, 5 Dec 2020, Will McVicker wrote:

> The HID subsystem allows an "HID report field" to have a different
> number of "values" and "usages" when it is allocated. When a field
> struct is created, the size of the usage array is guaranteed to be at
> least as large as the values array, but it may be larger. This leads to
> a potential out-of-bounds write in
> __hidinput_change_resolution_multipliers() and an out-of-bounds read in
> hidinput_count_leds().
> 
> To fix this, let's make sure that both the usage and value arrays are
> the same size.

Now applied, sorry for the delay and thanks for the fix.

-- 
Jiri Kosina
SUSE Labs

