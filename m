Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3336365BE4C
	for <lists+linux-input@lfdr.de>; Tue,  3 Jan 2023 11:39:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233298AbjACKjp (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 3 Jan 2023 05:39:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbjACKjo (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Tue, 3 Jan 2023 05:39:44 -0500
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224D3B80
        for <linux-input@vger.kernel.org>; Tue,  3 Jan 2023 02:39:42 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id B10FB32009A3;
        Tue,  3 Jan 2023 05:39:39 -0500 (EST)
Received: from imap43 ([10.202.2.93])
  by compute5.internal (MEProxy); Tue, 03 Jan 2023 05:39:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alistair23.me;
         h=cc:cc:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; t=1672742379; x=1672828779; bh=fU
        3Pu8HnB2cg4MbXdC8GC8qoQYxa1LahtWmk/Pmh83g=; b=XejJGx2FLowOeWf2Wc
        o637HYBXSn+3AJx1pvUjlwZDHOfjT3POrzUbT9wtAe1gHc+TKTYjlRRmuTE8WOgg
        cB2FDz1D7ldaVPxLovLOKCNTd+lAEkP/98QCzuRd30Jwus5QcZTJC8iuC9SWIIuM
        5RtbreaLikEsXGHurj5tSpP2Ygl2DnPHTJXnAxHeW806qxwWP+CuL0/GBNhFFvbS
        N1CeJXacwGtS3BfBwNhkodlQUFoAt5f1jn2J0yHet2xm4o6iWbBOFmgIUnKbFh+M
        a85zH8pZLMhUNrCJ+XNPN8NgjQEp7tY2Z7yXxr1F3opH198pxiO7sQQZqDRwu9c/
        Qqqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; t=1672742379; x=1672828779; bh=fU3Pu8HnB2cg4MbXdC8GC8qoQYxa
        1LahtWmk/Pmh83g=; b=o0r9GSvoI8EKwdYmQqokm2Ip5LsvQbtRZeYwBIxedXIX
        OcCAWhJFR2txwr1GHe7Dw66ATklnZZLz69NSAgTS7GGO2wNgUXuexv4xNH7AvpHA
        4UByQuVAKyHfRsKizvXvyqOFME4igG8Ssy1qapjhy0BgZyAkK0B5YE5MTRNUZHV5
        2NvfcOjZ5xvAMw4MW57yS1Fnl2SoRyQvmCmqBQcelpT736rjUq0Sv4weh9+qJj9B
        fBNCBLpez0P6v+jSkzK1dKXGUW0l96aKDPC5d/+V8hr2B6oTBtCTUddu1DR4qAPG
        6CdeaMbV8LSANN+Ov7IUF7bZWv3pqG5IyJhnaJA8pw==
X-ME-Sender: <xms:6wW0Y5T_IUXCVAbwCMS3d9t5VuwlpGXdVt6l-yOUY9rRGU7cRE66PA>
    <xme:6wW0YyzmfjfBvhVnB4wrFGOmtMMVq4V7rzktPlFPIPQJ2JxYYJXXH0ayzE0QC12tU
    Y6KU8XoC3MsWWXZcXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomheptehlihhs
    thgrihhruceorghlihhsthgrihhrsegrlhhishhtrghirhdvfedrmhgvqeenucggtffrrg
    htthgvrhhnpeeukeffkefhjeethedtieegudejvedvhfejleekheefhfdufffhjefgjeei
    heehhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grlhhishhtrghirhesrghlihhsthgrihhrvdefrdhmvg
X-ME-Proxy: <xmx:6wW0Y-3gw_OJdn64JiWHAaeT1Itn1mpV_vFr4Bal9N_LyOSDrzY4sA>
    <xmx:6wW0YxAf2-u7v9fmU1kdvxUmVk_TnL3gXv-6CC9l6GlNn69rLtI4qw>
    <xmx:6wW0YyheOAlNyNoXHGBrCJQ8w3YDtw-hxySxDpKNnH1QGrwQhLheFQ>
    <xmx:6wW0Y2b8MAjv2kIDgy0wfEgHFRei7kMjNF3iEO4FnBKADjHpUMvvow>
Feedback-ID: ifd214418:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id E835B2D40074; Tue,  3 Jan 2023 05:39:38 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1185-g841157300a-fm-20221208.002-g84115730
Mime-Version: 1.0
Message-Id: <d8398ac3-0121-4ce8-a700-8224bc9853dc@app.fastmail.com>
In-Reply-To: <20230102181842.718010-65-jic23@kernel.org>
References: <20230102181842.718010-1-jic23@kernel.org>
 <20230102181842.718010-65-jic23@kernel.org>
Date:   Tue, 03 Jan 2023 20:39:17 +1000
From:   Alistair <alistair@alistair23.me>
To:     "Jonathan Cameron" <jic23@kernel.org>, linux-input@vger.kernel.org,
        "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc:     "Jonathan Cameron" <Jonathan.Cameron@huawei.com>
Subject: Re: [PATCH 64/69] Input: wacom_i2c - switch to DEFINE_SIMPLE_DEV_PM_OPS() and
 pm_sleep_ptr()
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, 3 Jan 2023, at 4:18 AM, Jonathan Cameron wrote:
> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> SIMPLE_DEV_PM_OPS() is deprecated as it requires explicit protection
> against unused function warnings.  The new combination of pm_sleep_ptr()
> and DEFINE_SIMPLE_DEV_PM_OPS() allows the compiler to see the functions,
> thus suppressing the warning, but still allowing the unused code to be
> removed. Thus also drop the __maybe_unused markings.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Alistair Francis <alistair@alistair23.me>

Reviewed-by: Alistair Francis <alistair@alistair23.me>

Alistair

> ---
> drivers/input/touchscreen/wacom_i2c.c | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/wacom_i2c.c b/drivers/input/touchscreen/wacom_i2c.c
> index c9188ee00c62..a145b9105255 100644
> --- a/drivers/input/touchscreen/wacom_i2c.c
> +++ b/drivers/input/touchscreen/wacom_i2c.c
> @@ -232,7 +232,7 @@ static int wacom_i2c_probe(struct i2c_client *client)
> return 0;
> }
>  
> -static int __maybe_unused wacom_i2c_suspend(struct device *dev)
> +static int wacom_i2c_suspend(struct device *dev)
> {
> struct i2c_client *client = to_i2c_client(dev);
>  
> @@ -241,7 +241,7 @@ static int __maybe_unused wacom_i2c_suspend(struct device *dev)
> return 0;
> }
>  
> -static int __maybe_unused wacom_i2c_resume(struct device *dev)
> +static int wacom_i2c_resume(struct device *dev)
> {
> struct i2c_client *client = to_i2c_client(dev);
>  
> @@ -250,7 +250,7 @@ static int __maybe_unused wacom_i2c_resume(struct device *dev)
> return 0;
> }
>  
> -static SIMPLE_DEV_PM_OPS(wacom_i2c_pm, wacom_i2c_suspend, wacom_i2c_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(wacom_i2c_pm, wacom_i2c_suspend, wacom_i2c_resume);
>  
> static const struct i2c_device_id wacom_i2c_id[] = {
> { "WAC_I2C_EMR", 0 },
> @@ -261,7 +261,7 @@ MODULE_DEVICE_TABLE(i2c, wacom_i2c_id);
> static struct i2c_driver wacom_i2c_driver = {
> .driver = {
> .name = "wacom_i2c",
> - .pm = &wacom_i2c_pm,
> + .pm = pm_sleep_ptr(&wacom_i2c_pm),
> },
>  
> .probe_new = wacom_i2c_probe,
> -- 
> 2.39.0
> 
> 
