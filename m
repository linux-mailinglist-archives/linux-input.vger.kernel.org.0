Return-Path: <linux-input+bounces-56-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1377EB44B
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 16:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AE401C20954
	for <lists+linux-input@lfdr.de>; Tue, 14 Nov 2023 15:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E640341773;
	Tue, 14 Nov 2023 15:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBdaasBi"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF2D41770
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 15:59:18 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B76D130
	for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 07:59:17 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-672f5fb0b39so32949436d6.2
        for <linux-input@vger.kernel.org>; Tue, 14 Nov 2023 07:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699977556; x=1700582356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MWqNjMngyXDAKZphe8Tpl3Y485g1F1KSWWTOcho3eyU=;
        b=RBdaasBiDkeOs2IQiRLV8eTQeuAtbrwLb3IrOaHcXZeNFZW2hgxvdLAVUw7K3Jt+Mq
         OoAT3eD3N/pLPl/Rji5wab4Im+j2Y0HiYJ9f0DMV8k7Z1FmWhWw1gZ23F8iSByNEeFTb
         ohCqrG+HOtCUUiaXvZMEE4nLLMs6FKCJbNY0ODrHpLT52LHfGMrykTVHrEAcxwwXKbDw
         fbKpkXJ6wtVQafMS1uneQEHvOpCATFv74tIKvvKJyvDeI+Xz7H7LF+7RS0F56TDRL1lH
         aVF8VzST3Ois3yPNmSVCTjevxiMtFtUFXxCW2Q2gnM5Ak9dMfwdPPlHbkMXzs5VFy23+
         V9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699977556; x=1700582356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWqNjMngyXDAKZphe8Tpl3Y485g1F1KSWWTOcho3eyU=;
        b=b5hRjS6lP/Yw5f1+wYt7HKyQNRA78qzD7DX+Ug3MXLJuF2OoZFymx5/oqj2EPFyA2U
         VuOV9OGnSVu19zOK+t4+m74bWOks+Jh2LQ7fXeWzuwgR60I0s95qhkzm/DGnzckX38xA
         sQxxqeG+xgRKemJwF5oPmKjRyYrmB30xFuDmvn8q44zOyrOlwEgZ+5Rfj1k3NHqsQPH1
         8eEtLS3KMA0V+AfsLgJKzB2oGijqfodImac1l+Jydm1DKHsfxHvq+MNadhUFb9/DFTpL
         wC2uxZut0vwbs7S/jOGbhIQwAvCx/SOc3ZV811JAnWdT4U6gELwS/09VdhjrazaV7uld
         sMTQ==
X-Gm-Message-State: AOJu0YwIA7MFb3JLCc/YqmXY2ooyEDSvDXGeQxdOvm5APT8Kxx8ojhu0
	NAJj4g++keWk4HjiK/dZz/0=
X-Google-Smtp-Source: AGHT+IG7OjQ/Rqw/aenOOUSH6OsUpiYueTyCD+4IbU1YIQ6xLZGbVeObeRKSoZ/bgbxq826R4+xzYQ==
X-Received: by 2002:a05:6214:508f:b0:66f:baa4:77b0 with SMTP id kk15-20020a056214508f00b0066fbaa477b0mr3177957qvb.8.1699977556134;
        Tue, 14 Nov 2023 07:59:16 -0800 (PST)
Received: from google.com ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id f3-20020a05620a408300b00774309d3e89sm2751261qko.7.2023.11.14.07.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:59:15 -0800 (PST)
Date: Tue, 14 Nov 2023 15:59:13 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
	gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
	Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <ZVOZUa1i9dQfm76M@google.com>
References: <20231106155429.5377-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231106155429.5377-1-hdegoede@redhat.com>

Hi Hans,

On Mon, Nov 06, 2023 at 04:54:29PM +0100, Hans de Goede wrote:
> There have been multiple reports of keyboard issues on recent laptop models
> which can be worked around by setting i8042.dumbkbd, with the downside
> being this breaks the capslock LED.
> 
> It seems that these issues are caused by recent laptops getting confused by
> ATKBD_CMD_GETID. Rather then adding and endless growing list of quirks for
> this, lets just skip ATKBD_CMD_GETID alltogether when in translated mode.
> 
> The main goal of sending ATKBD_CMD_GETID is to skip binding to ps/2
> mice/touchpads and those are never used in translated mode.
> 
> Examples of laptop models which benefit from skipping ATKBD_CMD_GETID:
> 
> * "HP Laptop 15s-fq2xxx", "HP laptop 15s-fq4xxx" and "HP Laptop 15-dy2xxx"
>   models the kbd stops working for the first 2 - 5 minutes after boot
>   (waiting for EC watchdog reset?)
> 
> * On "HP Spectre x360 13-aw2xxx" atkbd fails to probe the keyboard
> 
> * At least 9 different Lenovo models have issues with ATKBD_CMD_GETID, see:
>   https://github.com/yaescallop/atkbd-nogetid
> 
> Note this also removes the "NCD terminal keyboards are only supported on
> non-translating controllers." warning since that code is now unreachable.
> 
> This has been tested on:
> 
> 1. A MSI B550M PRO-VDH WIFI desktop, where the i8042 controller is not
>    in translated mode when no keyboard is plugged in and with a ps/2 kbd
>    a "AT Translated Set 2 keyboard" /dev/input/event# node shows up
> 
> 2. A Dell Latitude 9420 (always has a "AT Translated Set 2 keyboard")
> 
> 3. A Lenovo ThinkPad X1 Yoga gen 8 (idem)

I agree that the mice/touchpads are not going to work if the controller
is in translated mode, however I wonder if on a device with external
PS/2 ports we could not end up with a port in translated mode with
"wrong" device plugged in.

Can we consider not skipping the check completely, but rather use DMI to
check the chassis type (we already have a similar check in 8042)
and skip ATKBD_CMD_GETID on mobile devices, but still try
ATKBD_CMD_SETLEDS on them?

Thanks.

-- 
Dmitry

