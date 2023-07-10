Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D758E74DDAB
	for <lists+linux-input@lfdr.de>; Mon, 10 Jul 2023 20:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbjGJS7W (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 10 Jul 2023 14:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbjGJS7W (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 10 Jul 2023 14:59:22 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BE5E100
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:59:21 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-668711086f4so3092148b3a.1
        for <linux-input@vger.kernel.org>; Mon, 10 Jul 2023 11:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689015561; x=1691607561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/j3sHjo3bsChmJr+h6Acq7tYUhV3cIbD/Ksuo80Kxjo=;
        b=EwTKnivRFWR5gleJXLc2Srf1c69ULpSrOX75U96FdxkU2o/hZdi6p3SDlLX9anpgY7
         s81aaASBvpb3EDjleybY55UihPCjV1UG2HpRxTWyzDD10Mr+tJzNYfqZffQFYEE+Ah5v
         EjzFf3NTqCn3AMLrPS0A7DQGqkttZOy4FL/wrH2tpnBeYveITWt2KfHYKz99dEIrplO2
         E2PZRPDVBZwBtuUOvpoBHvKhQMk4WMT8CjS9u9B3k1SymuOyd87kNwHBqr0GxZrbOy73
         avon+L0FVPP0m/eJCh7It4m3fBYFIkjW3yL57WGh05Aa0F6LvEJFpc9/DdxbXtOyyO9r
         nnXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689015561; x=1691607561;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/j3sHjo3bsChmJr+h6Acq7tYUhV3cIbD/Ksuo80Kxjo=;
        b=IuTYHZVyqA2MLpk7llp8VN3m2zh2foyC0uOQQFmYX/Cgb1APyaN3fiShzdNHHo8SSQ
         PSS92iZ1nDPj42eFgPGkbsW10rHdjyuIYfiPllZqAGJ9PLt1cFhhBclhpxVUvItsOYFg
         wgEvCrML1srPoX4TjUGfnLWnpdT5/xF7e7QiDjGP5ybOwHycBbNQ6nmLJ2LLnKNqNX25
         Cad2TxV2TKfVLAxgGx0ZmhLlUtF65W3f0s3skXqrrHGAtI1Ly2/rK9bNTAucaXDrxg1W
         nG6dm3PpfISztgdS5gR/Tn5htYnueomVLsO6uVl8qCt0lxTfjkHx1N6rmDJz0WxLN7XJ
         dvIA==
X-Gm-Message-State: ABy/qLbd3g73cuK0pxv33D0q3it15AM7xjPneVtviMEnzAx89XevGAZ0
        to213I/V7/Iu3g0nPKtyeqR74/WHRqg=
X-Google-Smtp-Source: APBJJlFoyLN0UCW/YrttqnyLNUsvC9OAreAUXQH/2IX6qji979X0GS+XKEmkIok8fwWKngbPVqo3kw==
X-Received: by 2002:a05:6a20:918e:b0:106:9266:4448 with SMTP id v14-20020a056a20918e00b0010692664448mr21321878pzd.16.1689015560563;
        Mon, 10 Jul 2023 11:59:20 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:96bf:7e77:39eb:7a23])
        by smtp.gmail.com with ESMTPSA id o17-20020a637e51000000b0055b30275adasm57152pgn.37.2023.07.10.11.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 11:59:20 -0700 (PDT)
Date:   Mon, 10 Jul 2023 11:59:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     "Nguyen, Max" <maxwell.nguyen@hyperx.com>
Cc:     "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: Re: [PATCH] Input: xpad - add support for HyperX Game Controllers
Message-ID: <ZKxVBULWtM30ZJ7D@google.com>
References: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW4PR84MB17807ECDCBA17E38BA87F9A5EB32A@MW4PR84MB1780.NAMPRD84.PROD.OUTLOOK.COM>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Hi Max,

On Sat, Jul 08, 2023 at 01:30:16AM +0000, Nguyen, Max wrote:
> Add HyperX controller support to xpad_device and xpad_table.

Unfortunately the patch is whitespace-damaged, could you please
resubmit?

> 
> Reported-by: Chris Toledanes <chris.toledanes@hp.com>
> Acked-by: Carl Ng <carl.ng@hp.com>
> Acked-by: Jessie Jin <yan.jin1@hp.com>

Acks should be given at least in public and they are typically reserved
for maintainers or people actively working on the code/driver in
question. See Documentation/process/5.Posting.rst

> Signed-off-by: Maxwell Nguyen <maxwell.nguyen@hp.com>

> ---
> 
> drivers/input/joystick/xpad.c | 3 ++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
> index cdb193317c3b..a5e507b8f619 100644
> --- a/drivers/input/joystick/xpad.c
> +++ b/drivers/input/joystick/xpad.c
> @@ -130,6 +130,7 @@ static const struct xpad_device {
>                  { 0x0079, 0x18d4, "GPD Win 2 X-Box Controller", 0, XTYPE_XBOX360 },
>                  { 0x03eb, 0xff01, "Wooting One (Legacy)", 0, XTYPE_XBOX360 },
>                  { 0x03eb, 0xff02, "Wooting Two (Legacy)", 0, XTYPE_XBOX360 },
> +                { 0x03f0, 0x0495, "HyperX Clutch Gladiate", 0, XTYPE_XBOXONE },
>                  { 0x044f, 0x0f00, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>                  { 0x044f, 0x0f03, "Thrustmaster Wheel", 0, XTYPE_XBOX },
>                  { 0x044f, 0x0f07, "Thrustmaster, Inc. Controller", 0, XTYPE_XBOX },
> @@ -457,6 +458,8 @@ static const struct usb_device_id xpad_table[] = {
>                  { USB_INTERFACE_INFO('X', 'B', 0) },          /* Xbox USB-IF not-approved class */
>                  XPAD_XBOX360_VENDOR(0x0079),                             /* GPD Win 2 controller */
>                  XPAD_XBOX360_VENDOR(0x03eb),                             /* Wooting Keyboards (Legacy) */
> +                XPAD_XBOX360_VENDOR(0x03f0),                              /* HyperX Xbox 360 controllers */
> +                XPAD_XBOXONE_VENDOR(0x03f0),                            /* HyperX Xbox One controllers */
>                  XPAD_XBOX360_VENDOR(0x044f),                              /* Thrustmaster Xbox 360 controllers */
>                  XPAD_XBOX360_VENDOR(0x045e),                             /* Microsoft Xbox 360 controllers */
>                  XPAD_XBOXONE_VENDOR(0x045e),                            /* Microsoft Xbox One controllers */
> 

Thanks.

-- 
Dmitry
