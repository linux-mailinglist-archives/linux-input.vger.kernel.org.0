Return-Path: <linux-input+bounces-1284-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A9C82F83A
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 21:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8E9E28654B
	for <lists+linux-input@lfdr.de>; Tue, 16 Jan 2024 20:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B59812F5AB;
	Tue, 16 Jan 2024 19:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWm5GT7T"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA95812F5B2
	for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 19:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705434650; cv=none; b=e7InVQ+OUQ+Ttq+zPmv3pbQM0atB57A36bmMgzoccfWAFQCw7kmtpj7S3TFn3q4vMRN2F/3aw0apHyEIsqWP+Ha7yImP3U6ALlx6dkEVzYTRytw8sPWw+eOkcKdowfxaETOwZYtd1Ok9s4fL3QG3AeDDALIn1Fc+VvQf1nvlO/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705434650; c=relaxed/simple;
	bh=isakIZnpzzfLnv3spKUUiR3Shbt13cDpq6O3pBh75sU=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=QDBGYyLE2UA/mEqhyC5IHTDdcXTK+uwjlfu9GynTTsOSeQ0ogmt/LeyM0T9YX9efoatOFw25P23LZfc3uEApJFlmdki2YW7DX4D52StJ9o5lrAKPo601ihxfqb556LLlAE5a9EK9qmcYLhQpm7xjgrmXREAaFPHHoaFTXdLSCMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cWm5GT7T; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6db82a57c50so1693088b3a.2
        for <linux-input@vger.kernel.org>; Tue, 16 Jan 2024 11:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705434648; x=1706039448; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RNdW3+1vYS+v+LoCPwbZ5Kczj+DmF72etIWLLTRlW8c=;
        b=cWm5GT7TOqGJQVpnGu5Qi/9vgabQkfAGQVPyhoQrOoOXz6p/4sWvfzaPZubzndw+F2
         pfJT21UtSKRC/eGR0Q/wGqoa7OIYVoDeEeLyJ6ej5iZuT85DpID4PYaIL8Qn8OMq7VHQ
         SlKRrD8mbTcmi5deFAUsgbPZW84oI80+R5xOYHmKcluuSckbSMRafcjeDexzwfdZQ7Fx
         ml4eTVQTik3rpZ1e829sIAtz+fQ3V/SbXvOVm2/o8cO7L5lj0+DBVjp45hERULQ5oZx/
         evaSQmpYoOlCorcr7LT0wcwl4D5hTT5W0soAeDmHSkiWKS4QKD10tTqEzf9WwqPtv5ox
         p3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705434648; x=1706039448;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNdW3+1vYS+v+LoCPwbZ5Kczj+DmF72etIWLLTRlW8c=;
        b=d4tdKizhIM6kE0N2QV90LSLsPWrsqFFpTi4MjjCVilxlULl21/DjUwD5XdgUYl4x0A
         7V2AlRSricKLyE661+FWI8uqIsA/ImNPPlpEAIDPOxhoXF8d1xQtN144VPYptnl8pvMG
         h33OtnK5HIcfipgHb6TobI3GewL5scyJ7IqGISZ867n1h9I5Toz7T0v33GKuNcE1vKbu
         tS404l+laz7EV/oOMi/TL7JAaNgPlanonnOIriMNOht1uXr/gaIZztIdm5x87UjwjyXv
         kCrP5OOrlZ1EKs++SBKK3iAfVspowF4D/VXmyEZExsLBhXHB54hIfD5HtrpOIdHxrBCY
         Upeg==
X-Gm-Message-State: AOJu0YxFKirJK81ljwLtZ4eDkg6ML+lbXhM2SEuUvoxLp7fO2apOxeJ4
	LoiYTBNuwnroPAikfihM84Q=
X-Google-Smtp-Source: AGHT+IEManUOnSzmHWmVzNkCCLWd65RhT8LuGZlHP/mw6uJ4bCRSAoChkkg/B9hBiFTDOLA3U1UA1g==
X-Received: by 2002:a05:6a00:c8d:b0:6da:dc40:8a20 with SMTP id a13-20020a056a000c8d00b006dadc408a20mr5358805pfv.33.1705434648082;
        Tue, 16 Jan 2024 11:50:48 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:5c15:9a6:f612:d37a])
        by smtp.gmail.com with ESMTPSA id r3-20020aa78b83000000b006d9beb968c3sm9712972pfd.106.2024.01.16.11.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 11:50:47 -0800 (PST)
Date: Tue, 16 Jan 2024 11:50:45 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>,
	linux-input@vger.kernel.org, Shang Ye <yesh25@mail2.sysu.edu.cn>,
	gurevitch <mail@gurevit.ch>, Egor Ignatov <egori@altlinux.org>,
	Anton Zhilyaev <anton@cpp.in>
Subject: Re: [PATCH v2] Input: atkbd - Skip ATKBD_CMD_GETID in translated mode
Message-ID: <ZabeFRKGZQn7QuIK@google.com>
References: <20231115174625.7462-1-hdegoede@redhat.com>
 <W1ydwoG2fYv85Z3C3yfDOJcVpilEvGge6UGa9kZh8zI2-qkHXp7WLnl2hSkFz63j-c7WupUWI5TLL6n7Lt8DjRuU-yJBwLYWrreb1hbnd6A=@protonmail.com>
 <162f0847-3f72-4606-a1ab-de05bdd97339@redhat.com>
 <DZ5T0aPAth1T_tvaht8979K9VSJFt5_00JStgZUA1nApXOA6JYcEjgdEnCZ-V1o_kKNya5nhqz9NTW76_xpQXMWvnGpu497KLsmPxewtEZ0=@protonmail.com>
 <20a1cc94-7f88-4b7f-879b-1835f804e8d1@redhat.com>
 <ZabTi1PbTl-uF5aM@google.com>
 <5207ea8a-722b-4431-8d50-8cec8356f1ad@redhat.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5207ea8a-722b-4431-8d50-8cec8356f1ad@redhat.com>

On Tue, Jan 16, 2024 at 08:33:39PM +0100, Hans de Goede wrote:
> Hi,
> 
> On 1/16/24 20:05, Dmitry Torokhov wrote:
> > On Tue, Jan 16, 2024 at 03:43:10PM +0100, Hans de Goede wrote:
> >> Hi,
> >>
> >> On 1/16/24 14:32, Barnabás Pőcze wrote:
> >>>
> >>> After:
> >>>
> >>> evdev:input:b0011v0001p0001*
> >>>  KEYBOARD_KEY_f8=fn
> >>>  KEYBOARD_KEY_76=f21
> >>>
> >>> I: Bus=0011 Vendor=0001 Product=0001 Version=abba
> >>> N: Name="AT Translated Set 2 keyboard"
> >>> P: Phys=isa0060/serio0/input0
> >>> S: Sysfs=/devices/platform/i8042/serio0/input/input4
> >>
> >> I see, thank you. There are no v0001p0001 matches
> >> in the hwdb.d/60-keyboard.hwdb shipped with systems.
> >>
> >> Typically laptop builtin keyboards use another match-type
> >> so that they can do DMI matching e.g.:
> >>
> >> evdev:atkbd:dmi:bvn*:bvr*:bd*:svnAcer*:pn*:*
> >>
> >> So luckily for almost all users the e field in the match
> >> rule changing should not be an issue. Sorry that this
> >> was a problem for you.
> > 
> > Hans, I wonder, if we skip "GET ID" command because it is a
> > portable/laptop, maybe we should assume that it is the standard "0xab83"
> > instead of "0xabba" that we assign if GET ID fails but SET LEDS
> > succeeds. What do you think?
> 
> That sounds like a good idea to me. I was already wondering
> if there was a standard response.
> 
> Do you plan to write a fix yourself or shall I propose one ?

Please propose a patch.

Thanks.

-- 
Dmitry

