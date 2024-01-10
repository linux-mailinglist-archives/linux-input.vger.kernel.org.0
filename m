Return-Path: <linux-input+bounces-1074-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA28219BF
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 11:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6423D1C21B32
	for <lists+linux-input@lfdr.de>; Tue,  2 Jan 2024 10:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8D1D298;
	Tue,  2 Jan 2024 10:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EKKewz7U"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC502F43
	for <linux-input@vger.kernel.org>; Tue,  2 Jan 2024 10:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a2776ce12bcso367746366b.3
        for <linux-input@vger.kernel.org>; Tue, 02 Jan 2024 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704191404; x=1704796204; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5OnAk2HagspHkAF+udzNuli8uER3UpQGGb9ZBjsj8o=;
        b=EKKewz7UX4Z76Uk+C5Pg8dPTZ7pmk4a53H1ELfBMiz50XA6JHS5vAL3Q40NXFh5bHC
         1xMb/Vnj3V4ypYbfh+iG2hBI5Q+ldlk04ERGbNyInuqa4AZQ8p9cS+/8dRdQpwtHdag8
         9DGwicXE3E7l2BB5hlLGIoMILZCstu0oZrwsn+JmCJlJOniJ8f8VuOQJNSuvqvWuz9Y2
         C+8CJEUDCnlG8WG1lOBRFmkxmhK2PRLV112xXYScA+X0Rr03WUhwOu0auY1UqdJfs2ly
         hZyyYiXcKZQyq8uaqp561pLKjzVEDnlX4ot+ZktWCk4NTlGsay7aAAkaRH44S9y4i4+q
         /azQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191404; x=1704796204;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5OnAk2HagspHkAF+udzNuli8uER3UpQGGb9ZBjsj8o=;
        b=EBE0ftwmAX5dDt+gQ8MkMK0gXizjD3LUA9gk3TqW2r7/QfJujrQrsx+Kq3wW79hEvO
         bAD2tFNoGXTsrlzmD8QE/Yb9/Q4pDyYGTJ0axCRl1Gc4HswdX8++zQa3JcVUAUx7MRZ0
         PH+AAvFcFfj0LzCbS7xnWL5PyR7ZWWpTJBGYNDztZz2dykYNiP5Uf74rEvVwoqzC1p5o
         7sRFGbnwXCc/NFalz1AJAVxAy+aCvLjn2jFa952N0Ge7Cq7VsV5aX9Kvi81xOBvbkgyJ
         XRSITltrJzvUJDQi2Qnrh0GwjK4VvfjCd0ErI6LsMR8yTPzhksvO30cjCEzpmssvtLea
         o1MA==
X-Gm-Message-State: AOJu0YyX07jX/L0TpWTwMaqtrDVmMnHkHD+xaVyNvuI87pj4c+RufLBe
	4NW3EBf+vr2P2lUk6VlBlTBtibFg2j0vXw==
X-Google-Smtp-Source: AGHT+IEXMA4fFMbDZYS+N6y5Kmz/iEV+EfBUdhBol5W6atC5vGMu4WOubKgeb/63OlnWpAXb/eqWZw==
X-Received: by 2002:a17:906:2c45:b0:a27:ab99:dced with SMTP id f5-20020a1709062c4500b00a27ab99dcedmr2661820ejh.20.1704191403985;
        Tue, 02 Jan 2024 02:30:03 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id gi29-20020a1709070c9d00b00a27c87be71asm2830450ejc.5.2024.01.02.02.30.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jan 2024 02:30:03 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Tue, 2 Jan 2024 11:30:05 +0100 (CET)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
cc: benjamin.tissoires@redhat.com, linux-kernel@vger.kernel.org, 
    linux-input@vger.kernel.org
Subject: Re: [PATCH 1/3] HID: make hid_bus_type const
In-Reply-To: <2023122045-pellet-eggbeater-8d2f@gregkh>
Message-ID: <nycvar.YFH.7.76.2401021129490.29548@cbobk.fhfr.pm>
References: <2023122045-pellet-eggbeater-8d2f@gregkh>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Dec 2023, Greg Kroah-Hartman wrote:

> Now that the driver core can properly handle constant struct bus_type,
> move the hid_bus_type variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.

I have applied all three patches to hid.git now. Thanks,

-- 
Jiri Kosina
SUSE Labs


