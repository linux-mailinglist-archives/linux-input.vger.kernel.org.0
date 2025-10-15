Return-Path: <linux-input+bounces-15490-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D9302BDC78D
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 06:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 900563BD5AC
	for <lists+linux-input@lfdr.de>; Wed, 15 Oct 2025 04:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D144258EC8;
	Wed, 15 Oct 2025 04:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYcvpLs4"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E251D8DFB
	for <linux-input@vger.kernel.org>; Wed, 15 Oct 2025 04:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760502675; cv=none; b=BbXwSaNSQeqSWbjPghgOfCfBghTIjJVsR5W9EVgUPlKucK33XEDf5DytdK6PA/e9AtAsOe2oDUenprdMSi/v1sZ/nayL+5Pym9XN0o8SXNqbq6hG7fAtSTbx7PgGFMnXLWNiBH1RLThmJH4K9YNeT/zDBpTRGBU1q/gYGJHC7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760502675; c=relaxed/simple;
	bh=WZDuYxIjoxmC+VGiYmi0zZZTyaYsaSjEDxMqtDZo/e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpSHSIkddRST1MqKYJnUAT9Z0BocyJYXbN79dRpmQ/gDjI4AdupAmfD8DUKOIrXq3nwXtqlrurCTKL5DIql4Lt2yVHWh5D/2y6n4bVxJxDGhT7aiwYwE3TpThdcyJF8KMoaoyirIsp+uExPd5auCvmcmVTJKVBNwtGNmC3w+Tik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYcvpLs4; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so4801742b3a.2
        for <linux-input@vger.kernel.org>; Tue, 14 Oct 2025 21:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760502673; x=1761107473; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zts79kuN/IJCAMCcBE3kS6G0VPd2KnMSc2XzegRhv7w=;
        b=fYcvpLs43kZ+bmg0oKnOUyfFzXpYH/WsqPVXSkr69oPcjfm4+Imj8wEsdkLd5fTcOA
         pQBfPYGUPRksA1b30j/zS7ouw00KuxIBmSCwtuOsnyE5IECU5woH4kEuTY+db6PZnRtH
         flS1MPWN0J7X7Jk6i03KnqiUXSpqHrFhpGI2944bfCFWsD20+rX6ZyygrOpKQP9v8X5D
         lHcPr20gVibgFUxI2v632xbNDI+bK5Rv3O1sF3KXMZwmJixKb4cpErZSmMMnrASyGDFI
         0eNHSWfNc7KC5sHZN/rvX4+E02evq+vUhG552saKUUNyutRwnaZNRUbHuGOJ3DLl3f8Y
         kxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502673; x=1761107473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zts79kuN/IJCAMCcBE3kS6G0VPd2KnMSc2XzegRhv7w=;
        b=GoVDoMzapC25Q411Oo/Sf6uE9vpfwVU8fTT5SIdiJYxNVu9zbmVieuBjeeutEzgFg+
         uHzd51/rMkJLgapnPM0xcNJJDa707+M08hmlDIMwac4R6L91nIy5Kwg35pZjOJP6XByC
         3MX3y/4Rm7ecA3r6fx4LBZKFCuVeR/SEi+f+qNbixTuWd6KqcFo4zRYBvOXjIfzQM0bL
         zFpmt1+/3day8XGga1kNcGXKhF0+bdBkDbjahxZxNWqt0yFYMWNjqJ8wjEEdpJRT9wa0
         jv15dDXjp7Osz2bpWxU1YZqxObsp01OQQrtiU0TB3smtYPUTgwMo+x5HE2IOYM7lqA4O
         Fepw==
X-Forwarded-Encrypted: i=1; AJvYcCVShOtyQp9Mqrk02ggk8Mr2+2u7frIhVjacEodGW0FOk/wTtcfSl1pe9QEI5mapqY3LIdbLKzXV9Fqy7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCUbZUEMHunvF6Ux/F5LIerujuPGa4XKMHd0o+KgL/1rFne0M8
	zlVk5fn9nNSzHUL0Dy929NfAdLTA7uhUrr65g9anvWgO7uXmIHsJCKm3BThLsw==
X-Gm-Gg: ASbGncvFejkv2xg1a9DSIUQvebN1U/dtBs6wHu+imQ7CjkZT2HtvLkZVipODZxy95tM
	scK0YiB7uKKKfGJVGP0EmNwZAFOJ2lC4Bkpz7dWXB11evw6n3xKCsGwaqXF/dj3Wi9PQd/Q4/lS
	Pxz7cB2bqYZPIUSYiVcMgOGvqN2YyRYL1kC0PkRaXYwrxYbEWXv/Wqjn4I4z6746r9j2dsXqwEA
	8eyRxecOFMpiKeNxt2oXUDyiZ3y3AqaDqU0kNS+l9pQJ2c/mzmIVzOJHy4Crn3yFsGD283vA9sp
	ceByUY7QuLqki96s7HxlgJJFUBVc5vgKvBKp9/6NHonNEiG5jIu+F1sUQW4aYjSXMGuiLIC5Qqx
	C+K1uR7qBLxoMrwPbc4F9TJQqEIf6Swv62eE+aLywE6xwrifwHgH/UtbleNusp2woVDFiRiGjW5
	GY4SVoJg==
X-Google-Smtp-Source: AGHT+IG6FhMTeWkEH9QZHgmRQ8kee57qbcSb2Gok0oXxXlAmHWNH0ugczjyMBwNxwo17qCCsOZtnkw==
X-Received: by 2002:a05:6a00:8c8:b0:781:27a7:dd0e with SMTP id d2e1a72fcca58-79385ed5786mr27588710b3a.9.1760502673174;
        Tue, 14 Oct 2025 21:31:13 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:729e:7380:f286:50df])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d993853sm16835038b3a.74.2025.10.14.21.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:31:12 -0700 (PDT)
Date: Tue, 14 Oct 2025 21:31:10 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>
Cc: Benjamin Tissoires <bentiss@kernel.org>, 
	=?utf-8?B?5Y2i5Zu95a6P?= <luguohong@xiaomi.com>, kenalba@google.com, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] HID: hid-input: only ignore 0 battery events for
 digitizers
Message-ID: <nsz6llo4nsg4zuiogmewuccl76nzjjijgkjzqeazzs33lj4phc@k5rskuabbsz2>
References: <of5qjeij72wduee3zyf26drfcwhpsl4sjs3v6tfjv3tgl3xsol@sss7zcyawwaz>
 <r20q42n6-n65r-3151-s194-10222o3o6s6s@xreary.bet>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <r20q42n6-n65r-3151-s194-10222o3o6s6s@xreary.bet>

Hi Jiri,

On Tue, Oct 14, 2025 at 12:25:25PM +0200, Jiri Kosina wrote:
> 
> Hi Dmitry,
> 
> thanks for the fix. It doesn't apply cleanly on a reasonably recent tree 
> though, as since e94536e1d1818b09 we're already propagating usage to 
> hidinput_update_battery(), and we're issuing explicit call to 
> power_supply_changed() as well.
> 
> Could you please refresh on a more recent codebase and resubmit? I could 
> do that myself, but I guess you also have a way to test the patch with 
> your use-case ... ?

Sorry about that, I made the patch on top of my tree which lags behind.
I just sent a v2 rebased on top of linux-next.

I actually do not have the hardware to test, we have to rely on 卢国宏
to do it for us.

Thanks.

-- 
Dmitry

