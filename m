Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E82863FCD92
	for <lists+linux-input@lfdr.de>; Tue, 31 Aug 2021 21:21:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239141AbhHaTMQ (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 31 Aug 2021 15:12:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:36424 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232759AbhHaTMQ (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 31 Aug 2021 15:12:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA79460ED4;
        Tue, 31 Aug 2021 19:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630437080;
        bh=jcJh1pux0sYJ/R82rcU7mVAgJZt9e1VXs9fQKtGVw+I=;
        h=Date:From:To:cc:Subject:In-Reply-To:References:From;
        b=B1k7mEedYt+XKchqGLp6Qb5WQP6donhkrKsncrOGJEnMg5DfhXgx9kzg2oGhrHFmn
         Aia5dULUUdOgpp5yUgsAGmcONS6uD3bH/cjtxMGoAutcs62R46MR16aPlQf+VMsRHY
         RFs7W89fT2kRZsGtefgis0eqLKoxBtM1e1w45h32l+tTIx5uGGfCww6qMvfR8qBESp
         2Tc0oJ3c6wdOIZD/8Npv5wEStEnBsOvIVHLzTH7JkxzvG1xMwz1/bmvgaRXfZRBFSD
         9AoHIzg9ckjCNDiqLzwV78YacKiFsVONzbRXD1BKN+U2GqR7aZA+AxixZawz85uCUb
         ADoMjsevJU6LQ==
Date:   Tue, 31 Aug 2021 21:11:16 +0200 (CEST)
From:   Jiri Kosina <jikos@kernel.org>
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-leds@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>,
        Oliver Neukum <oneukum@suse.de>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/6] HID: hid-input: Add offhook and ring LEDs for
 headsets
In-Reply-To: <CAKErNvokonsQr=j8cSXGRkVUTopBqq3k5NeiqTUWPKmefmOaJw@mail.gmail.com>
Message-ID: <nycvar.YFH.7.76.2108312110580.15313@cbobk.fhfr.pm>
References: <20210703220202.5637-1-maxtram95@gmail.com> <20210703220202.5637-2-maxtram95@gmail.com> <CAO-hwJJxJqgW6CGPmvL41teh6vgWfSg55qoXWL3TjQx+mvsbHg@mail.gmail.com> <nycvar.YFH.7.76.2107152057230.8253@cbobk.fhfr.pm> <YPCc/k89XNTmeKVo@google.com>
 <20210715224905.GA18180@duo.ucw.cz> <CAKErNvrc0NjVwpXiGVED0c2PatVh9ObUBjqem9mi8hq_TZcyWw@mail.gmail.com> <CAKErNvokonsQr=j8cSXGRkVUTopBqq3k5NeiqTUWPKmefmOaJw@mail.gmail.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Mon, 9 Aug 2021, Maxim Mikityanskiy wrote:

> Dmitry, what's your opinion on the points that I raised? I would like
> to progress with this patch set, let's discuss the direction and sum
> up the requirements.

Friendly ping on this one :) Thanks.

-- 
Jiri Kosina
SUSE Labs

