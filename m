Return-Path: <linux-input+bounces-3493-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968D8BD282
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 18:21:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41592B23A99
	for <lists+linux-input@lfdr.de>; Mon,  6 May 2024 16:21:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0DFC155752;
	Mon,  6 May 2024 16:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWyU8Mii"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571F8155757
	for <linux-input@vger.kernel.org>; Mon,  6 May 2024 16:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012390; cv=none; b=EF5a1HD/pYXY1qp3svCtMeawj5wtzJfB1ZmEVRJUFtzoRMj3cRQ4aF0+KtpwT2Bc6FIeAvHw6KzntecOpT2I75mTKX6ObxTwV//n7KHiX/PzmD5645tyEjC32Qk4ZIQZskHe+hfE3VoYnzYbZojjftP/0h6y9f1fp1pupZBy2aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012390; c=relaxed/simple;
	bh=AiTp5ttEtcTAOpx8P8z3zqQB2fjDxXB3G5zVd3VqjG8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o62pC10c5PRmwA7RE4HE+FnvvmSuyQivXsiR1VEUjTMDz1TJfPdQhCuhb7brsYPTGCbaBWnvh54JvZUHdKAftksyyFzKDnuYMfjeAJ+cSqs0E597anY0/ZOib9n9ZWHTz1ZVqiU+eBdJP8n8ZS89ERaD4BK7kbtGiWLWdrdGMZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWyU8Mii; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c96c096a32so685176b6e.1
        for <linux-input@vger.kernel.org>; Mon, 06 May 2024 09:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715012388; x=1715617188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ebMzbOlH4uOxeL5cGE+gP3ZFwHwbSdDe9BMgbY6tPJU=;
        b=aWyU8Miiuuf3lfvVJoDneb0lZbsbu+h9rteKAhBjuRzuZCI8nuhiQxuvffTPvi9t6W
         YpKW5o0sfFnuidtgipoZEgT+8+Ru4drfiRwiK7p7g6O4oGkTEWDMRDIvULMT+Zdn3fcX
         TjRa0ZUf86dL0K181VqIIZ77//89TNoIIKW4gpFnJOyuUyLvmJDr3kE+FYizN3MHhOGS
         A77Eap9i8AIU01n+0UM3RODSvrPpFS9twGmkxpPIlJxRTKHWsOo0wO5q25Vr8LS3tuHe
         00bUG2a0PSMamPgxN/1JfhJTAG6J6z1ZzE2RdARBmuzN+yVjr6PYy49/FP3YK8mFnYps
         taUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715012388; x=1715617188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ebMzbOlH4uOxeL5cGE+gP3ZFwHwbSdDe9BMgbY6tPJU=;
        b=jtMqfk5k8hfFldZeW7Ox0GxE4eCbIoTdjelOHRSyBsF44cbQ/EYp9RBA0u4q0Ef4eM
         6+3rc4YGPgKEPnjgtSn/gV7fCCnQzwwZBwP6EHXuMPg+3by0P8xFsPfd+fLetjDJhwZO
         5i03oOYy+yXn6oAoPT8EJWuewQ6maes8LoJ1PqubeuAJ1sdSWF2k5UzLo/t+M776d01m
         PnulKYcx77FAiF/IuaMOLJwthUl3YB4WmTjOQSWHD3OuHv569bQ1hkRzlHQxpXL6gEAU
         6e3rqJqqYMFD8n21hwjPIHf0oPgiPLrdPopiJwI2RZEEQ598ZuUNthzsXqNzkxdaIwSj
         HsSA==
X-Gm-Message-State: AOJu0Yy9F0c26mkKaP6subbRCwABfYoOvOFjlK7f4bnNezZk3zHzrS/u
	BBnVe+GhCgXGATU42JOwVHSQu1jmUaXU/DG63YO0SLTClBH1mJBR
X-Google-Smtp-Source: AGHT+IHPLAtmFmAZ2wdJqomxUCe0F5UqGixzLTohbI0//7fuJE9oV0pjsD8PZBUd+TNnfgj9h4o7Jg==
X-Received: by 2002:a05:6808:220a:b0:3c8:68e5:b9b5 with SMTP id bd10-20020a056808220a00b003c868e5b9b5mr13931131oib.6.1715012388279;
        Mon, 06 May 2024 09:19:48 -0700 (PDT)
Received: from mythra.localnet ([2603:6010:d800:cbd::b76])
        by smtp.gmail.com with ESMTPSA id ml11-20020a056214584b00b006a0e5cb0254sm3882050qvb.55.2024.05.06.09.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 09:19:48 -0700 (PDT)
From: Carson <crange76@gmail.com>
To: dmitry.torokhov@gmail.com, milas.robin@live.fr
Cc: linux-input@vger.kernel.org
Subject: gamecube adapter driver
Date: Mon, 06 May 2024 12:19:47 -0400
Message-ID: <4864668.OV4Wx5bFTl@mythra>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi everyone! I wanted to ask if the driver for the gamecube adapter has been 
merged. I was going to create one but I see it's already done, is there a 
subsystem tree I can clone and build somewhere?



