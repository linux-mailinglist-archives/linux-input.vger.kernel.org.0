Return-Path: <linux-input+bounces-3722-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADED08C70A9
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 05:26:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50DE31F226EF
	for <lists+linux-input@lfdr.de>; Thu, 16 May 2024 03:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C33879E4;
	Thu, 16 May 2024 03:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzMqxOSH"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4320747F
	for <linux-input@vger.kernel.org>; Thu, 16 May 2024 03:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715829950; cv=none; b=W2GEfK/jbaDdx7e3Ee5jChrMmMmmmS5kwXG+BSnMpOuIWWFzOiiQ2AEHfgzTtTnX7BGvM4qLj03Da+w5Q0cb2sxcNkIuLCZxy2mKo2QfaWtg7pocX00J/QZg0/IHhpvne3V4l2QcxPD+Kw3Qsork9OfHHhS+5MpDJJwLRiXT3eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715829950; c=relaxed/simple;
	bh=SolNLNjyowSD1jb60vShaNEVc1AS3hyRy/C/hIwg7r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aq8m0/fZZGvllffoharGa5L1LFQmhEn7Cksgl6pv4AAtFj+YwCGrVaerjy6sfUPTfdk2ZqtzpHAaeNu2BB2TlF1Ix16qH46MxuqLUoJ/PA8ZkYOCvBjMud3jp3FoAu3wwCjZsT5dOeo1Q/3kjz6A7T1zOfkU7v1QLZw2SrcAAgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzMqxOSH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2e538a264e0so3516181fa.1
        for <linux-input@vger.kernel.org>; Wed, 15 May 2024 20:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715829947; x=1716434747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SolNLNjyowSD1jb60vShaNEVc1AS3hyRy/C/hIwg7r8=;
        b=gzMqxOSHAskXAJRJ/GeluEjqbejQBqnr2aXWN6UL4wjI0DyWcQcHXFsckMX4n4Ra9s
         WUmw/wb5DB7aOXdypOzS3BzKWGLE/5g0N1lMMcDpERXAD0O3Z7xKZCXpWpkEaQ8zuJfJ
         qkTm+ecP8dOwHY+LnNqq6j8/0j2pAGu3POVW6E6mijlJ4qgXeCbjc2va9FQvyxTUonyP
         6Kh4JagJScBu+qUc/ainuG+lu+HSkQpSB7KrT+almzotWdwVww6Ss7eFgjd/05MVcqu6
         39GU7f0kO1LnFLbiT41y5eab1nSnLWc5sOOrIVDXCRl0kJ7bEEpTHJze4fpNnXfnAOOf
         5asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715829947; x=1716434747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SolNLNjyowSD1jb60vShaNEVc1AS3hyRy/C/hIwg7r8=;
        b=XywD2dLBRIPN7CzOG3TtLMMMioN5m7kgRVTqrD+1zl/CHgoRvFULSLW+fOseAywnpS
         zQZONiI0ai0OrtQq+z8O1yfLV1Wb+WagLzDBFjvfqVqSI0vjBRI17bRWONNGuO4LSUJK
         4VzFyNZ9u4jMmt8OJfS4tYre6hMpto7sNKW03cOWkRjgBizijNtCT0KPtbkNcV8I4ieI
         0EkylZmFJk7O0mOsI0aTUV+vLz6cOx9GRTorunvd/ebiBmtRtunCYYUDxz1F4hvzT3n+
         Vpi8Y3HQvAT3PPOYHnCqcPtyOS+jo3W4B5iOI2VWyf8qIxp8t6ICzlw+YKew6YoGA9U4
         uVhw==
X-Forwarded-Encrypted: i=1; AJvYcCU/iHnbAvIhtLZUdsM3QWf2IyJn+7dtTNgRqWwrfzNtbnyCjDxQkNhkiqAGspBoQc0fxOv96vnBmggV5260KpmTL36TRz24ywW8Hbc=
X-Gm-Message-State: AOJu0YwcYkG81mn74V5iHvZ7AfZm1PIlLAQ5eRTG6ViRvHKI3+yE4kCu
	JD8fEpS8PCqtsSXrBo9WgpNwpgtEneEf5OcUuhUHlOuQc1OtmYac
X-Google-Smtp-Source: AGHT+IEFuZHpQfGjGN8IaICgRUVd45NKi+41bsfOsJwP2UQTUP1JZN7C4IiIq4VwhO8XPymWL0Qa9w==
X-Received: by 2002:a2e:80c3:0:b0:2e0:b713:6bb3 with SMTP id 38308e7fff4ca-2e51fd3fe8amr173465671fa.8.1715829946654;
        Wed, 15 May 2024 20:25:46 -0700 (PDT)
Received: from localhost.localdomain ([94.25.179.14])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d1515608sm22762731fa.77.2024.05.15.20.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 20:25:46 -0700 (PDT)
From: Kirill Artemev <artewar6767@gmail.com>
To: artewar6767@gmail.com
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - add support for Machenike G5 Pro Controller
Date: Thu, 16 May 2024 08:25:40 +0500
Message-ID: <20240516032540.12239-1-artewar6767@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240516020826.4051-1-artewar6767@gmail.com>
References: <20240516020826.4051-1-artewar6767@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I just now noticed that I added the VID in the wrong place in the xpad_table.
I'll send the patch again, but already sorted correctly.

I apologize for wasting your time.

--
Kirill

