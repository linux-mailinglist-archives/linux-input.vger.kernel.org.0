Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0E392B39C4
	for <lists+linux-input@lfdr.de>; Sun, 15 Nov 2020 23:03:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgKOWCU (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 15 Nov 2020 17:02:20 -0500
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:48997 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726924AbgKOWCT (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 15 Nov 2020 17:02:19 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 500699E6;
        Sun, 15 Nov 2020 17:02:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 15 Nov 2020 17:02:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=who-t.net; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm1; bh=I
        WA2mVRjVeLe+ugwr4gmD7NsR5QAbcoEWJZjRzCgrNg=; b=EGj7CXV94ixDhtAT0
        72eOZT1D6pf72/tbX5mUV9yekPZyP6cFy/P0gSMKqKl3tLqA9V/0n5qZtJLTefk5
        iLI/xnSTi4QpLsPDb9apzHUfLAZHLJ2B8NSLcOAGgptnKBKms/XcwPjC1UGuoh7o
        jd41AozrfCz6pdZ1jgxlC/iNhzBf2LLrxjdgWgwwYlzWFH1cu2Jf5t8WjCfZR6zf
        NBOfwwDJjaOaxx2AKMOR7tY27QhUlSGg8x0XWXl/svoOzorl/E/YjR61az2G0RQx
        KCmdg812EnfPsaI1bzJc4RL7Jsb4AUJC/UGFgV3MO4BjpmG0lybpp0XR1TJTGWSv
        P7ZZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=IWA2mVRjVeLe+ugwr4gmD7NsR5QAbcoEWJZjRzCgr
        Ng=; b=sAXIiMYtGc5TkfqiZMu04fXxd+Ifp5/C6nD2oLZBYmSKGtwwNl1aV2gwT
        SRGICQyDnf4V9QwxJPcgcQTZdd4MZkX7qwnm+q3CbhQ2qUCzeB/VVW3Ww20QeaV+
        QCrM7ZNBDAi573LH80KQV2aXko4GiGBhHqZKRvSLqvUbM0H80JLPmNuagRb/fjq0
        fmTO2GopddxnwVSS2y+D4ZnGMXvXJIOIR+TACM7Xo6go2YF1JuS/vIMU3nu9DzIF
        yoMVpUD/Yvv1uRi8OhlDyb41bGpP0WTnemr0fajJSFeUxXc/5THRjG/bF1igJfiN
        1jsz3q/8rwdz3t4ueB/eZdKA1k6hg==
X-ME-Sender: <xms:ZKWxX82Y_mvLELYdUWGnwjknn7icp5heq_X8FmAHbC4nhREE902ezA>
    <xme:ZKWxX3FZoaP3VzT-N0c3RsJYm0jv_kyT9iA6PAbc46Aec8nRzl2my5PiY84EOGxqx
    uNXxC5idH-pJXeIaR8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedruddvledgudeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefrvght
    vghrucfjuhhtthgvrhgvrhcuoehpvghtvghrrdhhuhhtthgvrhgvrhesfihhohdqthdrnh
    gvtheqnecuggftrfgrthhtvghrnhepgeeftedtgeefleffhfdvffffhfegleegjeeijeek
    keetfeetvdffhedtkeeiffejnecukfhppeduudejrddvtddrjedurdejfeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehpvghtvghrrdhhuhht
    thgvrhgvrhesfihhohdqthdrnhgvth
X-ME-Proxy: <xmx:ZKWxX07zmgsQdLlGM7vnFn_oag_WVaJy_SLh-uWAp_YCFS15Eg7ZJQ>
    <xmx:ZKWxX10YXVycIt35P5w3OZDTeD-AC5utTYOizb05W7ju7ICfICH72w>
    <xmx:ZKWxX_Gxhk8NKe6SGamxTdERMosbCD1qwsbe4kRn82pbrPRZQkw1Fw>
    <xmx:ZKWxX3B6qqk7Kn3Hwje_5gwfUz8GFu9hnVsJBsGd8z6rbQ2wkkWLqQ>
Received: from koala (117-20-71-73.751447.bne.nbn.aussiebb.net [117.20.71.73])
        by mail.messagingengine.com (Postfix) with ESMTPA id 56DF03064AA7;
        Sun, 15 Nov 2020 17:02:10 -0500 (EST)
Date:   Mon, 16 Nov 2020 08:02:05 +1000
From:   Peter Hutterer <peter.hutterer@who-t.net>
To:     Benjamin Tissoires <benjamin.tissoires@gmail.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        linux-input <linux-input@vger.kernel.org>
Subject: Re: [PATCH 08/15] input: touchscreen: surface3_spi: Remove set but
 unused variable 'timestamp'
Message-ID: <20201115220205.GA765581@koala>
References: <20201112110204.2083435-1-lee.jones@linaro.org>
 <20201112110204.2083435-9-lee.jones@linaro.org>
 <20201113074028.GI356503@dtor-ws>
 <CAN+gG=FjNfV9D9tYgMNYbCe6kgjFc0jDnreFsqOZ=2vnOv9eGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN+gG=FjNfV9D9tYgMNYbCe6kgjFc0jDnreFsqOZ=2vnOv9eGA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Nov 13, 2020 at 08:42:37AM +0100, Benjamin Tissoires wrote:
> On Fri, Nov 13, 2020 at 8:40 AM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > On Thu, Nov 12, 2020 at 11:01:57AM +0000, Lee Jones wrote:
> > > Fixes the following W=1 kernel build warning(s):
> > >
> > >  drivers/input/touchscreen/surface3_spi.c: In function ‘surface3_spi_process_touch’:
> > >  drivers/input/touchscreen/surface3_spi.c:97:6: warning: variable ‘timestamp’ set but not used [-Wunused-but-set-variable]
> > >
> > > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Cc: Henrik Rydberg <rydberg@bitmath.org>
> > > Cc: Benjamin Tissoires <benjamin.tissoires@gmail.com>
> > > Cc: linux-input@vger.kernel.org
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  drivers/input/touchscreen/surface3_spi.c | 2 --
> > >  1 file changed, 2 deletions(-)
> > >
> > > diff --git a/drivers/input/touchscreen/surface3_spi.c b/drivers/input/touchscreen/surface3_spi.c
> > > index ce4828b1415a8..72dc4c562a4e1 100644
> > > --- a/drivers/input/touchscreen/surface3_spi.c
> > > +++ b/drivers/input/touchscreen/surface3_spi.c
> > > @@ -94,9 +94,7 @@ static void surface3_spi_report_touch(struct surface3_ts_data *ts_data,
> > >
> > >  static void surface3_spi_process_touch(struct surface3_ts_data *ts_data, u8 *data)
> > >  {
> > > -     u16 timestamp;
> > >       unsigned int i;
> > > -     timestamp = get_unaligned_le16(&data[15]);
> >
> > Benjamin, should we pass timing data on to userspace instead?
> 
> Last time I checked, libinput was not using the HW timestamp. So I
> don't mind dropping it.

I'm assuming this would be passed on as MSC_TIMESTAMP?

I never found the time implementing this and I mask MSC_TIMESTAMP on most
devices anyway (except for Dell's i2c touchpads where I need it to work
around a fw bug). so at least from libinput's POV it wouldn't have any
effect either way.

Cheers,
   Peter

> 
> Not sure if chrome/android uses it.
> 
> Cheers,
> Benjamin
> 
> >
> > >
> > >       for (i = 0; i < 13; i++) {
> > >               struct surface3_ts_data_finger *finger;
> > > --
> > > 2.25.1
> > >
> >
> > Thanks.
> >
> > --
> > Dmitry
