Return-Path: <linux-input+bounces-66-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB67EC8FB
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 17:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E339D281414
	for <lists+linux-input@lfdr.de>; Wed, 15 Nov 2023 16:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E6213EA62;
	Wed, 15 Nov 2023 16:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EJhr7I/J"
X-Original-To: linux-input@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF15739FC6
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 16:57:43 +0000 (UTC)
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57A7A6
	for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 08:57:42 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-66d17bdabe1so44386676d6.0
        for <linux-input@vger.kernel.org>; Wed, 15 Nov 2023 08:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700067462; x=1700672262; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1x9R1YSMtIDXOY8NGRNz1DEQdPm/O2O78pgU5S8Hxw4=;
        b=EJhr7I/JowDz1Po3AsdM2M/i1zyLhzScScRjfbxkebOOpLPDdxdy+90DwyxW32INCV
         g7bb3bJSW0m/aF8jbW4m8yEw3hnhlV6o1MC4eFZxHBYlxq6GTnrETwS1Vo3KLNe4yAKd
         7Pf+EYIvEnKzEtrEcdJXvZNrQKBkuDIu2aK+l8gGuCEck5A2gSLgnBsUk0cSyzdoHJW4
         S8L8gEjNwklLo5OwAbl6nhkDhZ+mYmtwPXz3HKE1FVL6w+Qattmb5ztmM60WiejpKrUT
         3iYrqKJiCQP5tq6218Je1irVpgDG/vZK2pA7ubTBKwaJAqC5BCMrBtqm6jUELj3usQde
         zagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700067462; x=1700672262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1x9R1YSMtIDXOY8NGRNz1DEQdPm/O2O78pgU5S8Hxw4=;
        b=UkVjlGSJuCzbaNJzjE9bh+CJeyovVo1vKXKMizCLocMw2SQ47cF3h8haKeNlCK06ET
         lrXFQqgNvNpuMvoT7WsW7ZKm3iBMExGOVFuRloDQpr3pkAdkLJLu1Q4KZYvPk4tp2MQF
         pSNaw1KTgGH/YoK99gchDnOwg/R7ap2Ln0gFsjHw6VpwKZCbH8UfyaSmDdvbC+tfSAkt
         7VOwf3QgxsNGh/MKDjzDIQhMx38WHcVxYVzn8hnhiVoBZNwrIOy5QXnnrcIZj1u64KHx
         9qiZxdOwp8FyOSwqYh/MLClVTAcxWEeKpZufToIATU+jj4gMFJS5dKdihC7l7G5v+qXU
         sWpw==
X-Gm-Message-State: AOJu0YzwAz9yABWT8nQUS4+LPPhclxlphmEvQilJqv5jvVQ2KbGTeU8E
	hlgRDSge8O+OnqzFKa0ehTw=
X-Google-Smtp-Source: AGHT+IFz+mw4hPmT4In3mdPGGl4jilSo2flRmV/qc0FnnkrlDaXtzRHshv+tlmwNmEUBGLkOQhhwWg==
X-Received: by 2002:a05:6214:c25:b0:66d:1624:2203 with SMTP id a5-20020a0562140c2500b0066d16242203mr6753177qvd.20.1700067461669;
        Wed, 15 Nov 2023 08:57:41 -0800 (PST)
Received: from google.com ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id a5-20020ad441c5000000b0065af366bdc1sm655942qvq.103.2023.11.15.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 08:57:41 -0800 (PST)
Date: Wed, 15 Nov 2023 16:57:38 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Cc: skhan@linuxfoundation.org, rrangel@chromium.org,
	jefferymiller@google.com, linux-input@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH RESEND] Input: synaptics: enable InterTouch for ThinkPad
 L14 G1
Message-ID: <ZVT4gorWmFwNvGU4@google.com>
References: <20231114063607.71772-1-jose.pekkarinen@foxhound.fi>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114063607.71772-1-jose.pekkarinen@foxhound.fi>

On Tue, Nov 14, 2023 at 08:36:07AM +0200, José Pekkarinen wrote:
> Observed on dmesg of my laptop I see the following
> output:
> 
> [   19.898700] psmouse serio1: synaptics: queried max coordinates: x [..5678], y [..4694]
> [   19.936057] psmouse serio1: synaptics: queried min coordinates: x [1266..], y [1162..]
> [   19.936076] psmouse serio1: synaptics: Your touchpad (PNP: LEN0411 PNP0f13) says it can support a different bus. If i2c-hid and hid-rmi are not used, you might want to try setting psmouse.synaptics_intertouch to 1 and report this to linux-input@vger.kernel.org.
> [   20.008901] psmouse serio1: synaptics: Touchpad model: 1, fw: 10.32, id: 0x1e2a1, caps: 0xf014a3/0x940300/0x12e800/0x500000, board id: 3471, fw id: 2909640
> [   20.008925] psmouse serio1: synaptics: serio: Synaptics pass-through port at isa0060/serio1/input0
> [   20.053344] input: SynPS/2 Synaptics TouchPad as /devices/platform/i8042/serio1/input/input7
> [   20.397608] mousedev: PS/2 mouse device common for all mice
> 
> This patch will add its pnp id to the smbus list to
> produce the setup of intertouch for the device.
> 
> Signed-off-by: José Pekkarinen <jose.pekkarinen@foxhound.fi>

Applied, thank you.

-- 
Dmitry

