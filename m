Return-Path: <linux-input+bounces-6636-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2301997E0C6
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 11:47:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 538A11C2061C
	for <lists+linux-input@lfdr.de>; Sun, 22 Sep 2024 09:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C4AE22094;
	Sun, 22 Sep 2024 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NIFfR2PQ"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A71828F4
	for <linux-input@vger.kernel.org>; Sun, 22 Sep 2024 09:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726998459; cv=none; b=XvDwr+hhsQRGS+OIq0SKwwvgLdXwr3D99OsOoCukvx2z8/NFRXWnZC4trhxE1zzc//niQTEo3WRaipzLuw3ciGx/zeUPDrh9WCnfhVSNyKeccc94AvvaZHRaB+ww6U0pP3EGkSnCLBLsivybZgR/FXoGT5btuRBpthEMLaCjKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726998459; c=relaxed/simple;
	bh=h76XJMKXY6IsdQFinB19K3B4OMwXXbStloyfJI926ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YqwJiKdLGfyPTNQ+78XJRqSbduTunYCxwYNqpxfDsgd0imJLqOmHeAMu45CaRXb5cnsdshVORfOLnN679Y+DQ9lPdHTqDD9CN2MELQf4NaHlRmpyfR29Fa3AC+OydOWi1J/O5C4iZOhs+8g5L/mEEVS0lXivgWF4WUptmnEcg7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NIFfR2PQ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2068acc8b98so32197545ad.3
        for <linux-input@vger.kernel.org>; Sun, 22 Sep 2024 02:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726998457; x=1727603257; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zsHHZKMbXhfhSZMoRnd9N2cBZSjDF11kicDfhdR4WS4=;
        b=NIFfR2PQNLoQPevLZDHodzswPT9PEQK7Z+aSrKeLrTh8mONCxt/4LFOTUbg38sjVbC
         LkLc0/+4pr77Vmiuz4PS4BCFFYwwJGYevmZPFzhmy3Uyy7/TCahLxKE04TBHfW2ojhqr
         WvfWKn/Z2u+3NR0tnTrJ5jH9yIsbfQcHF5YX7MUVSAyjlfgsOKKFn5veq5MMaB/43v2B
         YV8ogDRs9NPFiKiweQ8mGWwO6rDzGUzvVCTwoSdRdv7cDNEUN2Ncyi+kT+2yB0cK2IGs
         SpPgoLrbsNszsJvUZ5g3JmrWWKbtPe4LDdnrLdP/ygJ2Y/yq7fgT/M3YikaGj83w7BTV
         N3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726998457; x=1727603257;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zsHHZKMbXhfhSZMoRnd9N2cBZSjDF11kicDfhdR4WS4=;
        b=KeF5d6WmtbzFcfN3URuppfFfjuPcg37GI3gSEPDmuGV57eRovrIxIs3WEq7ihLessM
         oOx4hJbd98ShNcTOb4JquLu42CeQVrqxdDwmeHMzpYPdtmjECrA00VtdUxziwzYm3b0x
         Pod6XYidnH3MoqwiCtjUFr/PJFtqUuOna1gDTbCVLw4zKL9i/9yiyRm6/jy3USwlN+iH
         wvUXgtmMcTYftwMVfF/PHM5IJ6UCUyJhBlrsrojOxLLxpq4pegFaOwIBOPCE316A8/k4
         bf0fK2VzL9Znb4rxPTLv/bo1dzUm6Nmx07/KpzGpgxwIOA3qRF9rcSWAshiGEBv7ztBB
         5sVg==
X-Gm-Message-State: AOJu0YwNQaNl9xpgGopNYkuawSLYYZ/ZjMG59oIEnQOqYLcvnD3pdu00
	VlkxPZwIrW59ObcUzXhZus7QjHHTQ3JarO2INaEr1799b2NqRnay
X-Google-Smtp-Source: AGHT+IGaw69OBBiACoxRsPgginQuTUr7Z9POR/S6hYwlcmtcYc9utyiAImMCl6Z986ct2BYjAMawkg==
X-Received: by 2002:a17:903:11c4:b0:205:43b8:1aa4 with SMTP id d9443c01a7336-208d8398d30mr119893735ad.19.1726998457025;
        Sun, 22 Sep 2024 02:47:37 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b28c:8c72:94bf:ec28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da66esm118321825ad.49.2024.09.22.02.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 02:47:36 -0700 (PDT)
Date: Sun, 22 Sep 2024 02:47:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: hynitron_cstxxx - Drop explicit initialization of
 struct i2c_device_id::driver_data to 0
Message-ID: <Zu_ntXO3OC2QwEKi@google.com>
References: <20240920153430.503212-12-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920153430.503212-12-u.kleine-koenig@baylibre.com>

On Fri, Sep 20, 2024 at 05:34:30PM +0200, Uwe Kleine-König wrote:
> These drivers don't use the driver_data member of struct i2c_device_id,
> so don't explicitly initialize this member.
> 
> This prepares putting driver_data in an anonymous union which requires
> either no initialization or named designators. But it's also a nice
> cleanup on its own.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Applied, thank you.

-- 
Dmitry

