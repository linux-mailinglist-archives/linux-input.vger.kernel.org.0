Return-Path: <linux-input+bounces-3750-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C7B8CA53C
	for <lists+linux-input@lfdr.de>; Tue, 21 May 2024 01:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB1A31C2090F
	for <lists+linux-input@lfdr.de>; Mon, 20 May 2024 23:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89961847;
	Mon, 20 May 2024 23:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYN/qaJM"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721CA2D
	for <linux-input@vger.kernel.org>; Mon, 20 May 2024 23:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716249105; cv=none; b=dGiQ5HGjaGs4YNCBuIqpQEiej+14xDU7RbK03tAu1HGcYACdsGNL4meoEsgYkbI+pmEVeQT191jImnZEVW9ManfOHwK9TlT9hOx3Wsk5kr4d2zeu7xiTheSIlamwlOEZC9gL1KM23hfdHlytn9TA2ezVPcdvufvQlE/yoXP5ERw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716249105; c=relaxed/simple;
	bh=CtChkje/Fex1PM/PMCy1mwTc9atq1r1kozeR4XfqDIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=js8iKEM/gurJOgF4NU3LLIsWfmh+tziEL5TkGCYxnrFY2CfYWfvhpVNfRYVU072sYPW9FCTWElKPRu96RvoE6VK42RQoUGL6wnqnfGuzI/9+y8UJIXXZfnul9vrf9jB8/cBmfk1SsVwbjLcAov20FLMGXg4YrIpCW1b/JKNj2/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYN/qaJM; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-61d35d266e7so33871317b3.1
        for <linux-input@vger.kernel.org>; Mon, 20 May 2024 16:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716249103; x=1716853903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e0jxEpGkaZkYyFKZrbmBCyiDQCFRcjjjtirvZkuTBjQ=;
        b=FYN/qaJMd+anUVW2TqnR2P8DLDwL6klPYCFg0KEO2Dfg8wurdt/nOkNaAzG/dqVn1E
         xSJNUcXwE61qPGv6wsu4cZIHfniblG9u10XnlrF01r2+aWMZ4GkZB0UPPYHq3+FB2hWa
         wFdAqLCMDBX/bSVXvne0zCKgr3H3Hf+mc3jZ9uPZpx8lJ7YSPqjegkDLGXqdd9mh695O
         tUnBVFRpgbu3bnAXYrFmHeAccGVd+jXGWHLVpLLzNmko3ZBtfE5mrArUPkkB7Dt7xxMQ
         tSY2m10Y5THUj8+3S95g1CBXoGlAJXVL6lBzXz8GFCX3AF5sVoGYxTRHI8WB6yAWyn3Q
         8g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716249103; x=1716853903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e0jxEpGkaZkYyFKZrbmBCyiDQCFRcjjjtirvZkuTBjQ=;
        b=cfvQXevNXmRbCWuQjXX5TVXVPw7jzlTJLvYMJBExqIkY2Tmw+altmhX5Z8G5lHKZQS
         NSb9QB/7M+11JMxFYTDXrT39sw6JAKPbYAhyuQq7EXwYZ6cRDdNPnlkV6ChMigMR0PZp
         xfvP1xHQFkiCHW/dJkO3w6xTuGio0iO57EOSqY9TjUsytj5tk+bVtr44wiUKFAMF+Nsm
         tzRF4wj8bRacv3WbwkmlBqyLALzWlJ95CmsFEB7boT+fX+R9AsBvhK2kykJ0btGuKtDA
         TI6pBifFhwEGF3KO2tt+IlxmaIUclWylN/K4sDTHXwKTszkbNZk+r3c36fYZD0Zs4y/j
         +aag==
X-Gm-Message-State: AOJu0YwjuZFi619inBO3PBmR/OVKixVBC667R5tWX90X6bjMSKZMHgv7
	oz5nbdorRwK/O5KAVSZqiY2GF4YHXrn+ORQgBor+pRXxzy+pdVlXET8UKg==
X-Google-Smtp-Source: AGHT+IHzyVEFxpys4DnpQKSmnFgkc+cVZ/Z0sJIz2oGLHvg0xVBHcimdBJ2wE5tQEtOMRy8EEtYOkQ==
X-Received: by 2002:a81:4c4b:0:b0:61b:1b51:371f with SMTP id 00721157ae682-622affdea5cmr315181187b3.12.1716249103201;
        Mon, 20 May 2024 16:51:43 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2e3e:3013:ba6f:ef71])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6209e48a06dsm51477487b3.130.2024.05.20.16.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 16:51:42 -0700 (PDT)
Date: Mon, 20 May 2024 16:51:40 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Kirill Artemev <artewar6767@gmail.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH v2] Input: xpad - add support for Machenike G5 Pro
 Controller
Message-ID: <ZkviDOUnhET5dVQn@google.com>
References: <20240516032926.12501-2-artewar6767@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516032926.12501-2-artewar6767@gmail.com>

On Thu, May 16, 2024 at 08:29:27AM +0500, Kirill Artemev wrote:
> Add VID and PID to the xpad_device and VID to the xpad_table
> to allow driver to use Machenike G5 Pro Controller, which is
> XTYPE_XBOX360 compatible in Xinput mode.
> 
> Signed-off-by: Kirill Artemev <artewar6767@gmail.com>

Applied, thank you.

-- 
Dmitry

