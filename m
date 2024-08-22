Return-Path: <linux-input+bounces-5733-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D13A95A95B
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 03:12:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6611C218D3
	for <lists+linux-input@lfdr.de>; Thu, 22 Aug 2024 01:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D708BF3;
	Thu, 22 Aug 2024 01:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBTlUa11"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AED0F79C2;
	Thu, 22 Aug 2024 01:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724289116; cv=none; b=LXohMj5XUuu/eZasD2BEZCsxcaFA7ZzPmM7p+O7m+lD4Rn4xcbV1kNeqvhopFzYEpZgQqsm4wtFBge5w21tRp9eM/q77dzI552Xa/6Q7rOka6GKUqgROB1L+J+veet2zCx6S+oOkKUDDaO9yn5xXlqD6jI0M4BJqQXzWhnY1t3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724289116; c=relaxed/simple;
	bh=jvHVlV2uEuBktlJkmbIqlf2pEH5dXc/5lijoPUA6dso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p91vnLJ1nPbkyLFfH7BRXHXYUOWgaO4y/cxUt2JzqcuyE3h12b6bf+SJ0KjfrQeuZ3SZquruBL649arURT1L2oaxakBsYk1Jb9i8CWAp+sFBbtgTe0lBZIik8x49rZdsxGpriwV8LMNQ9hUtlcptA8NhPCTHYABdHi2UmDJKT6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBTlUa11; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4281c164408so1334405e9.1;
        Wed, 21 Aug 2024 18:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724289113; x=1724893913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jvHVlV2uEuBktlJkmbIqlf2pEH5dXc/5lijoPUA6dso=;
        b=jBTlUa11C2rhGQK6lsGhF0T7mZDELMv1XYKV3KXZUHJxYWUQaCys+9EmcRCs75EwN7
         WEw69tp/iZ9qUBn+kKXy9S4wQwbrFfHbM4/zbzLRC6Fiu87FHii8teFZllN3j8yjNgV0
         GB+7axA0AU77R5ovT4Lkir/RI/v1tgUSQub/hb5tTuRdIqQoc4INSkX2mr2MTincuqwZ
         fipWB91YNGSOjOpVuwyhYvQUWXJbX0JXuPGdAiEqCgFLZfwOizvryBsIMQAeSPdJiJxt
         LQPe6iMsbFNHp2awKKJBYooY3UP605RHY5miUplvSR8PtiIIB5CaujnXR6fW+WT8aUDI
         TuBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724289113; x=1724893913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvHVlV2uEuBktlJkmbIqlf2pEH5dXc/5lijoPUA6dso=;
        b=ch3RVDeC3x+s5CvQo2YU2yuxL7DLeKdIFBkTrX+Eyyx5gE6oVOx/uua0SbcLo65FsR
         viXc8C/xxREO1E3iv0NwGS2NJoZPyju2pwAjlU4GQZasQkZIQGNiCFXf4+wSUXsCKQO1
         RjxN+DyzY3+emp+Fvadmh3ya1i2jekph2Li6Z37yAe3C1yoVp8vTRs0NaTuL4dHO59bS
         vSr9aIJG/l3wLypk8ODrpGQkFvQbKIkXHbzGgi3xq7hCVmssg0sy7Sw+dLK/bg9npqBw
         OFadD0J/Tyy4u3DEUBycjrLEof8daVTDo/RNCxxN4zjUnvymcWdwWx1+qgW3N+sVbrWY
         KPHw==
X-Forwarded-Encrypted: i=1; AJvYcCUwxqN2/JMLyqb8E1ac9q6sDUktGNMY1IH3dQ60qJpZd6VmQheO8+aZgc9ragpvGAcbjIkb6UwttTpE6yI=@vger.kernel.org, AJvYcCWbMIrq7+jTqrmNlCD146ksO3JTGdw05I3wp2P24rD5ch+imBzaZud6LXT8vFJvkquuoShMu2DsPPv/Nb6TLKw=@vger.kernel.org, AJvYcCXoGFhOa26Q7ik2hFWX45RSjfLd5UlqGCrGQTGNNY9aH5ogjEji4O2N/Vf/co9eOTNSTa1e95nopvGMZH2R@vger.kernel.org
X-Gm-Message-State: AOJu0YzdnT1/coAT/EHtw8Ymd2AfYJ19uKwqiyUs7pwXBjD8l3JFZFVi
	m5r0PgJHvDyfANO75+y3i4f7cyWgIaNA9h6HzSKZvxsHAsT0M+igv8tpR3mgnnSpoCltHaX/eyE
	XYxg/yBle3LbsmD61fht2Mug/KEU=
X-Google-Smtp-Source: AGHT+IFj6usCQ2iMJaIuGGLNO/7KM6UaWtWH12TZIWIN43beByh0swjOM7nwZ+dRqc21tfTiV6u3zfWyBsC+vES7amg=
X-Received: by 2002:adf:e10a:0:b0:368:8015:8a96 with SMTP id
 ffacd0b85a97d-372fd6d564emr2651456f8f.16.1724289112335; Wed, 21 Aug 2024
 18:11:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818231940.34635-5-stuart.a.hayhurst@gmail.com>
 <bd07e14e-eae8-4264-b275-9efdf635cd82@web.de> <CALTg27mgOx3W3WENxFh0sEEeNYKEjrZCEQGoBi9=vjgiaZnZtQ@mail.gmail.com>
 <65b8f7e4-358f-4943-8ce0-c28e4c947016@web.de> <CALTg27nu2_26WwFKc2hWbWY9B40QQLxJ_bM97OWY9VoRo-d_FA@mail.gmail.com>
 <f0aa2ca0-6256-48e4-8d2a-dfd5da072ad4@web.de> <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr>
In-Reply-To: <78b667fa-8e54-4023-9187-4ecb999d3c01@wanadoo.fr>
From: Stuart <stuart.a.hayhurst@gmail.com>
Date: Thu, 22 Aug 2024 02:11:41 +0100
Message-ID: <CALTg27nmNR=AXg=Ku_nXtwFQLxMypdbK4_Bu9CruB=vEDzxZoA@mail.gmail.com>
Subject: Re: [v2] HID: corsair-void: Add Corsair Void headset family driver
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-input@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> If I recollect correctly, there may be an alignment issue and just using
> the stack is not enough to guaranty what is needed.

I can't find any reference to issues with it, I'm not sure what I saw before.
Also, it seems like the hid-asus driver is using it:
https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/hid/hid-asus.c#L391

Stuart

