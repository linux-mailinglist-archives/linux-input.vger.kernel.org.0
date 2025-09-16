Return-Path: <linux-input+bounces-14754-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E507AB589CD
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 02:39:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50301522C65
	for <lists+linux-input@lfdr.de>; Tue, 16 Sep 2025 00:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99B5283CC7;
	Tue, 16 Sep 2025 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="No1Z87U1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0909A15665C
	for <linux-input@vger.kernel.org>; Tue, 16 Sep 2025 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757983131; cv=none; b=IJKh5QN8AaqBx8Vq6F8ftAZEHv5b7It+uEiSerB4ac1Kh9xIMXcEKwsCP8DAR8q4yVYUl6YNakr1guh5M+4RDhkgBwHsJ8F9XrJ+TflWGxEso/HQDlqTvSISBj3yPPV9bjNI4OqfPLaLhzzvbN48DpttUz4H1PdC/oKvwXO9Tx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757983131; c=relaxed/simple;
	bh=fCfZk5qBctW39PFDrEg1ReclqN41xzGlJWi8/4C79r8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH9WDx97LTUFMFWhSi0E+Re1x5MY0Jt2qQlVsy05+yNEXgKGQ0XRjgASxcY2yDXU8D8+KltzBda0J7YuVnXUHJOITbXLA0BbsU9qVXSz4x7TG/t+6xD8u1hgxu9Xhjz7Wu+5Au92qjsTaf+rdeRwYjYnqhNGPxBUxtHGVT6WUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=No1Z87U1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2639bffd354so14931605ad.2
        for <linux-input@vger.kernel.org>; Mon, 15 Sep 2025 17:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757983129; x=1758587929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wzTy1GEKlTZD9blTzB9EKyxfAV8idgtoLZgPRKdhUSI=;
        b=No1Z87U1ExPhpfVQJPmYZC14R9tZsjFfprjdfcgkP7g6FU0BpY95+NxXTMzPOH/p14
         6He4GqfIa0ZlBldZhtK/9GA3NXwLtc46Ce+kbUQaz9hyywewMe8v0wbr437uGFNuit8n
         LodnryL0ikUBqGteyPzosGihY9fb3q42gqiGdbJNxfJQRTOXqSeMUrkMAj7lid7n+l/4
         LWi+366EM70mOWDPxap5zOEyq+Q01DoAXJ9miXGJ0Chr4BzcgMQX9aqX4l83LbPgBrPL
         9LQ/05BiTreCx+H2hePMLC+pPM1mRefYD2MGiA4t4gwHM2zsdGesLwjYOsgnMnWo6GCo
         sWAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757983129; x=1758587929;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzTy1GEKlTZD9blTzB9EKyxfAV8idgtoLZgPRKdhUSI=;
        b=e2R2Qk+xedmk04Y/s7ZkLotxZ3Y27ncMuJyvTUFkDJuiCXtYt11scnDZj0UEjQfwvB
         zueGs5XwG0HgWs/XVlYttFXZPq49YltZqWjCHHaLIbRZn5e52Nz7ZJA2uhBafmz/AgGz
         x7vNIn8WmN2jBmO7tjNkJhJ0zIWpYTKHA3n9kiZqC5H3HrvfJ6R9CYodhauiwgis4EWF
         1UzLs/LTFxFJSd5Ga1Q1mMu1vBBa78r5jOEkBLjKS/lAmYUXuUOLkTd/WEZPLYI4Beob
         Fj8haOH+MEMzu0aewBs+5GrPvEBM1s3Ix5lg2CM0B5Yo8zZAYOlvw0H0k8Pfh3nYQkNO
         jbQA==
X-Forwarded-Encrypted: i=1; AJvYcCXs8/Et5JWfshcz9k4ti4AwrXV3nHF+D3QdMOVYlLiielNTvQY/RBBKtNuDajqI136aKakWCXNUyF5/Qg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Gn6+nB3YEg4MWFX+RtgK43oP+wsvrF/4lkqLi/NVno4pZjX2
	2t/UoE6wBSnSjAahQ5wpKZPKVKeOwt+bkZ9tlXil7Qk/ezdJdl/Xky+g
X-Gm-Gg: ASbGnct/thP8URu0SL3r+CMBO5L918f6XGE+SnZcRTpJpXzbK1a++QXqUbuC3hYtfi1
	R06UJiLdKrhkes1EkaOSmMPSEePGpHmP9oHKxxVTmB+gJd2L17HRsbE/9iDtrL7dA+wHMgwgZW6
	7XM34O9wH7wfVsXTg72V0uLMsvgOc+mdRuzFCvrflesCkuU3Dsqkxy+RmsMSpIMYe5Pkd44znWm
	hXxqRu7EbyJ39c5mi6WPOKri3r1pNsntre3+gNMhKt6GKYykB8bg8+SwfyteRlaZ2/qPSMwJhcd
	oR7kspC++UO4BhQqLkXZRSPlYs2cuYTx8ZjamnI34/IkUKqbw+a2nVQ5OeOwAzXE8TSTfo+9cd+
	RCX5QezaOPrI3wrxYvNH0WJrkeyWvj4rQ+A==
X-Google-Smtp-Source: AGHT+IEbcZ/tyusr3scpobNc9upgjYfXNOlqeZDVXTTcmyrv4QOc4h+s97sfIzG789CN3nRJFtRoOA==
X-Received: by 2002:a17:902:dacd:b0:25d:8043:781d with SMTP id d9443c01a7336-25d804381bcmr172273595ad.21.1757983129260;
        Mon, 15 Sep 2025 17:38:49 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:df19:cd01:3e91:19aa])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32dd6306edfsm16270991a91.18.2025.09.15.17.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 17:38:48 -0700 (PDT)
Date: Mon, 15 Sep 2025 17:38:46 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Al Viro <viro@zeniv.linux.org.uk>, Oliver Graute <oliver.graute@kococonnector.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Yu Jiaoliang <yujiaoliang@vivo.com>, linux-input@vger.kernel.org
Subject: Re: [PATCH 2/2] Input: edt-ft5x06 - rename sysfs attribute
 report_rate to report_rate_hz
Message-ID: <it26gfh7qwemksyqw3btcqyr4obbviwaywmyptsjedil2v52vi@rylzlifvans5>
References: <20250915201748.1712822-1-dario.binacchi@amarulasolutions.com>
 <20250915201748.1712822-2-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250915201748.1712822-2-dario.binacchi@amarulasolutions.com>

Hi Dario,

On Mon, Sep 15, 2025 at 10:16:32PM +0200, Dario Binacchi wrote:
> The sysfs attribute has been renamed to report_rate_hz to match the
> report-rate-hz property from device tree, making it clear that the same
> parameter can be set via sysfs or device tree and behaves identically.

No, this attribute was defined since forever and we should avoid
gratuitous renames: they will break existing users. 

Thanks.

-- 
Dmitry

