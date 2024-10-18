Return-Path: <linux-input+bounces-7541-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B207E9A4665
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 21:01:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C64628114B
	for <lists+linux-input@lfdr.de>; Fri, 18 Oct 2024 19:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD6B188596;
	Fri, 18 Oct 2024 19:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FhP321k+"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8200015E8B;
	Fri, 18 Oct 2024 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278101; cv=none; b=SqVgDdeDJIJb6VpaB2kZ9tlQfr5W2tuuRVOu1S8++0MEFXz2BQRRNZ7k1SBWWeCAbw41BBl1Q9ZjmToLfmg5KKBGWMRyX5M/Lmg6QkZ8TlHa3Y7ONvKhQPpRsVbr/v+qJNLAIlm/ZOFKeIWalOgcWRzMsR8pyjZGWZxr5T42z8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278101; c=relaxed/simple;
	bh=bBK3G71rlhHcLMyqsep8Yy/JTXCI1YwMqCKDTkhJEs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sd+DytuPFErUFaqC1SSIs1YIwEfB+RmPUWZYGJdSOK83oFrbCc84AczzD8O+06x25HYo/PvE+lZNe9UCU5wB7F6E31NAV4N11d/D7ezS9BVrx+T7cbkw8zV7q5M6vOn0vRcStGaeR9dAc/pek+CWl2h66z2C47JSR4gN/sNaN64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FhP321k+; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71e61b47c6cso1974782b3a.2;
        Fri, 18 Oct 2024 12:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729278099; x=1729882899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1JLOrMI9Ab2CEEJTwJMNYNIhkArN3p05bozHHeHC/A=;
        b=FhP321k+eP3EYdN5McK273ifqup0bybFvMolvT5ia/tftOqwpnfxa/CMgLIsD+PVU3
         1EKc5Lvg6L7OKs7XV/BwOf7IGUVtbOhzpoELUOjAGGpoKjbgk2HzplETalbmgUCPrV8I
         fJYaH70/Qe2bYJxHwf9+rXMgBIPP1SJfoXltapO13+YbqY2V9A82HTFLpU9WGDm48vKg
         v+uIEQQhMf1UdpBLn9CetMu9to4vzejqfOn5yhN5fPBw0yhOAzjIXKHNZOLVTj7VzAHm
         xrowlxwkrfg+SmTgOLmhTjoCe64L4VR/y5cf5DMBB4LjGLjCTLRhMhRfZWWXjWcCCZo0
         MAbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729278099; x=1729882899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1JLOrMI9Ab2CEEJTwJMNYNIhkArN3p05bozHHeHC/A=;
        b=hKoahk2V6MsKGBg3ttIP7Z8qX93/yhq91w5YMyXwE9PCvILNl1IZX6x2MC51ju6XBk
         BNDGRtdQXloQ+nMC7wewIIqPjP/qjHIT5oD7zk2EILsjOFSdXNiINqTyzxF8eyEhLZNo
         2qQoR8SZNOke831HliEYCy/aiv/N8zj3VP34e3wAhSnY8c7+by7CI2jgeygWZfRuwU2O
         +SXX5ZVuIHxTlqIY8kNL0guZbYkv2cKVQYSjCAZGd1RxkW7ZEmpNDH6bCLs7ZBv0Gfcf
         7l5VDV566SJyndT3D8opvuwdAepEtXZ6g7YhJ4V1Vam9kc8tAM5EzmCSedDDHp7xY3cL
         Barw==
X-Forwarded-Encrypted: i=1; AJvYcCV5xLne7Y4Y4vrDNrV6t1X6j25QRI4sDTQz1bur73bASU35jW9UyD25AReukC/M8dxW48eSpaRr/LYlO7B6@vger.kernel.org, AJvYcCW7ucGZYTf6iSeRNVmIGS0PpzZY7B+FYX9B1Az6oJ5Rl7aIfmqinlcERQEJUfSoOmmAChe3fpgp3gFyJXoj@vger.kernel.org
X-Gm-Message-State: AOJu0YwvRXbp+x8ZOBMW3+tMhXqn7JLC7NZj2tfJ9prxAqZV7H8PLoik
	Y+7dv7NUM7/s6y/438lv4hhF4vEhXqqW3Q4QyRYBTIlooNHOpFPwSW/PuQ==
X-Google-Smtp-Source: AGHT+IHGq5mY3FeO9wE1luTog2VAFD9RsRW1psaVcgDUtjFqGR80bBXJoEFW4dodP/RUuUDuKzyVng==
X-Received: by 2002:a05:6a00:391e:b0:71e:2a0:b0d0 with SMTP id d2e1a72fcca58-71ea315a361mr4587527b3a.13.1729278098447;
        Fri, 18 Oct 2024 12:01:38 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:351c:e27f:10e5:484c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea340969dsm1849847b3a.99.2024.10.18.12.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:01:38 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:01:35 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kamal Wadhwa <quic_kamalw@quicinc.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jishnu Prakash <quic_jprakash@quicinc.com>,
	Rakesh Kota <quic_kotarake@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] Input: gpio-keys - fix un-responsive keys issue on
 hibernate exit
Message-ID: <ZxKwj8RFXFmdiVi2@google.com>
References: <20241018-unresponsive-gpio-keys-hibernate-v1-1-12f5e9962054@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-unresponsive-gpio-keys-hibernate-v1-1-12f5e9962054@quicinc.com>

Hi Kamal,

On Fri, Oct 18, 2024 at 06:22:35PM +0530, Kamal Wadhwa wrote:
> GPIO IRQ setting may get reset during hibernate mode, as device
> is completely powered off. This can cause the GPIO keys to become
> un-responsive after hibernate-exit.
> 
> To fix this problem, re-request IRQs in restore() callback, in the
> hibernate exit flow.

No, absolutely not. GPIO state and configuration is owned by GPIO
controller and it should be the entity tasked with restoring the
configuration after hibernation. Individual GPIO consumers need not do
that. Same goes for coprocessor and what's not.

Also, as a side statement: whenever you call devm API outside of probe
and remove path you are likely introduce bugs, because that interferes
with the original order of acquisition of the resources so order of
releasing them during unbinding of the device from the driver will
likely be wrong.

Thanks.

-- 
Dmitry

