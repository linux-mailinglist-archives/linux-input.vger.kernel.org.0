Return-Path: <linux-input+bounces-1274-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DF882F4FF
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 20:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA4071C21303
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 19:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B5701CF87;
	Tue, 16 Jan 2024 19:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MPvSWNsP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84AC1BF29
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 19:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705431952; cv=none; b=t6mXxuC543vND4LQWK66YEaMOHZgiG2QYtY758j1+NmxlKgundSqaOlHDc3HdN+0wa/+Prnzv87KypziFgCeqHkBtGAndDl8MHdaG5iAx6TDgbJ6hHAuYQmcbf95P2kbF6EriGBFGp9wncnXdLCS7fY8PbkqJVbDW7L/WFBFm94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705431952; c=relaxed/simple;
	bh=zp5DAUasDX5CuxVQ2w36DwjjWB1VzJ4akJH4ovSqxzE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=SEKk0Uz/ezwJcnJBEpmPcmAy6iGX75t3lnuaO0R+W/Vrn/wXe+BQUbaKqeFUy8IE1LMtXuby6RyGK/1uRXgb+volGa8I94qHk7RrAS52BZudd5QRQw6AWrq/8LM+JHgChCK8XqIqAxoQPokn8Q6ELmdxSLNNgjvZlBnYSTuVr7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MPvSWNsP; arc=none smtp.client-ip=209.85.166.178
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3606dc50447so49673025ab.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 11:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705431950; x=1706036750; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xb3OSCtvNsA44+oTeeg5PlC0zSnSiMqHUZGFHY4kUyM=;
        b=MPvSWNsPcz36y/KZTDEZx17zUfVPh+K8j2muD4C/H69ceCES+xLtEYeoMxBbW6FoMJ
         LPFELY2plrqLSiufhhmHvmQ6ZeDp/ovh5sMpFlYVRLlCxIeHyOE4dxi5rQ6S4tdbZge9
         pueSuHjEq/uDJLf22geCsoJSP3LfIRmnrF+jh+AJ49Ripr+dgB5Dfc6zjwPlIzN1np+O
         xSZtZHUUxefWFOlPkYTAvPTN9YbudeW/99xm8mkW2JKUFV8FUGYJuOfRoZ6oMaYOXj7O
         2VNZwNNn9ViZYsmkYbASlwdkwaDtrHtMqSM1PrpMMjgdErV/YDPgqnUtj1yZMl9Q5owE
         BKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705431950; x=1706036750;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xb3OSCtvNsA44+oTeeg5PlC0zSnSiMqHUZGFHY4kUyM=;
        b=SyWcEZaCTZ+gbTcQebEbGoya5KnztAB7nY/xINzEwzNEHOlamE0WrO3Hqll1QlhztP
         zL/+2UUEyMuhdhkbEgLoPMSQ6tdTHONw1JCGNRQVkTjobd4lvu+vliLnobiHHXBg0E67
         l4/eaJ48ha7IRL5v4WNzjNhU1NLvhKCmiXnDLJZV7tyHDwKDcnLh91JJLWYonjUsEkxC
         L3dISkId5v/aA92iIxiTFJBfvfKbTvLr3pPAhjkJ23ruvWeIkBwg8uka3EuFw96RGK7J
         WS3Wm0PqawG2/ermputLV1Z1CJ06WrJalf8nBO95UYAD8WIG45MD86KJt2mxb/BMUyEO
         pDLg==
X-Gm-Message-State: AOJu0Yy/MFIrI/xBmLkUBMRr9QMN9zXPfsT8a2BOl5vj3Ka1HVb7k4cK
	th4hgpFP6os04Fj52/chcx0=
X-Google-Smtp-Source: AGHT+IGGnEg5wmY6T/L9XM4mSiuZHINRgKsBU1TXWyr541rDOGozIQScA3aYRZRjioBsA6gYbeW5aw==
X-Received: by 2002:a05:6e02:1d0f:b0:360:b60:6af2 with SMTP id i15-20020a056e021d0f00b003600b606af2mr10563490ila.32.1705431950537;
        Tue, 16 Jan 2024 11:05:50 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c15:9a6:f612:d37a])
        by smtp.gmail.com with ESMTPSA id b13-20020a65668d000000b005cdf0b46fecsm9226430pgw.81.2024.01.16.11.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 11:05:50 -0800 (PST)
Date: Tue, 16 Jan 2024 11:05:47 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
	gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
	Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <ZabTi1PbTl-uF5aM@google.com>
References: <20231115174625.7462-1-hdegoede@redhat.com>
 <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
 <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
 <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
 <20a1cc94-7f88-4b7f-879b-1835f804e8d1@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20a1cc94-7f88-4b7f-879b-1835f804e8d1@redhat.com>

On Tue, Jan 16, 2024 at 03:43:10PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/16/24 14:32, Barnabás Pőcze wrote:
> > 
> > After:
> > 
> > evdev:input:b0011v0001p0001*
> >  KEYBOARD_KEY_f8=fn
> >  KEYBOARD_KEY_76=f21
> > 
> > I: Bus=0011 Vendor=0001 Product=0001 Version=abba
> > N: Name="AT Translated Set 2 keyboard"
> > P: Phys=isa0060/serio0/input0
> > S: Sysfs=/devices/platform/i8042/serio0/input/input4
> 
> I see, thank you. There are no v0001p0001 matches
> in the hwdb.d/60-keyboard.hwdb shipped with systems.
> 
> Typically laptop builtin keyboards use another match-type
> so that they can do DMI matching e.g.:
> 
> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*
> 
> So luckily for almost all users the e field in the match
> rule changing should not be an issue. Sorry that this
> was a problem for you.

Hans, I wonder, if we skip "GET ID" command because it is a
portable/laptop, maybe we should assume that it is the standard "0xab83"
instead of "0xabba" that we assign if GET ID fails but SET LEDS
succeeds. What do you think?

Thanks.

-- 
Dmitry

