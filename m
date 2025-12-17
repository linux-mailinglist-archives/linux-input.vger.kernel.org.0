Return-Path: <linux-input+bounces-16617-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E918DCC93CD
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 19:14:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7E3330A21B1
	for <lists+linux-input@lfdr.de>; Wed, 17 Dec 2025 18:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0ED82652B0;
	Wed, 17 Dec 2025 18:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeXm5BwG"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1374321638D
	for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 18:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765994937; cv=none; b=FHUyEqOQzmomMNo1iVVQAkAxRrRkaWOeXJjgqbWRg0ib5bi4mbHRGRUq18tGp8F9xxUHF4ULuYthL6V1fr/BHcMxkp921yjK44ULC4a2H+B8qVp6gfX5fLPm9M3hur24w19oFF7AveaYzkm+rcgojbmX4TXx0iw6Qd5jHX1Zx94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765994937; c=relaxed/simple;
	bh=RRwg03yom6dj4jnNSu2S0a/uUOdoLROZKaE2kRBn6Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cxAlCzV/fVSMt5O5NFBQRpCD93Cug73YsNdVcD3wEOmC9ksvIAK2o9bNxcQoSOIldTYg4bOf1IF7seme3OIsqSf6dLOfDRM4ERNRmP4/WsqOzKjfPk5SnLSMU4Xr68BX4U2PHIPiYSOdDMQcVUZ4GL6Aw7qcoZiGtnju7Iic8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeXm5BwG; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a0834769f0so47643245ad.2
        for <linux-input@vger.kernel.org>; Wed, 17 Dec 2025 10:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765994935; x=1766599735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M1mUa8oVFGs+3M++JiFnrFuG8jrbwbFDcaIZY3QE2bo=;
        b=MeXm5BwGtjhDbdKu2YSO7+7p4BBH0HHPJd1bhsa4raChJ5aPh5R9vlhRSrFTy2JHXq
         rhHXWLTOqafHZwP+pC027yeoNleg2qejQ4IKisH0dVeANk2zQD5Wbx2n4tlSoe4KOLGC
         bWa1is6TnBEOIYnO5Ef/wswMzVxAo3IvLfxBjv2ElXOsJ8HYV5UIaNDQbZE4T+E7z2J6
         4jHk61EVuujfSLzF9JOhH/yDK5ooUKfgSNFP+u9zfZpBNno0liMOohMWZFYKdJPv839J
         CQA2ZmhyDgBEqstSSFuFZxmTlZuWGNee3xeKelN+ionpbItd6m39SZdA3e6rJ9vL/5oV
         9gPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765994935; x=1766599735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1mUa8oVFGs+3M++JiFnrFuG8jrbwbFDcaIZY3QE2bo=;
        b=xHTf0H1UjDrGouS60H/GN6G0dkUvUZveKsGAp9ARib2e6ViEaEEeiAN6L27Vfr5UYX
         lrR/4qb892jciUrFMeTe927HwzoCTYwnOnv9zi+fQt/H2q7SUZ0QMoi7YDQdXkzjxkf8
         IylcVIWYoRTL/iSO+ecEr86seNE7h0FKoXgoRWyK/qYp2g6z1BoiSVVP42i57UjtAMPN
         gLJk+AnhuapcEXaMaAU0l1JQwtKFOM7plA1z3mD/5/XbhRT5f6wSmbobfqWubN3oV+Zr
         F+rQpq9dnXqHCKHKmZNcdQUgjHZlsgGKHBjN8Y2G5hILIT5cYJ9jwWHmVVx5IQETXYMx
         ow0Q==
X-Gm-Message-State: AOJu0YyPgOy13LSbtRTdOVQrR3KLL/nW8hZHYPUfxlKUe2DARN9PaIcq
	A9XpVY1v279yo2YX/ZEBo8YsF2G+UWuUbt7i9VeOWcPCqihkYWyFPU/I
X-Gm-Gg: AY/fxX4VVpMCyEIGUHS9ftWUgSDAWyCtmOVWst1qy7LXB9gvpxCwHKHlnI2pH3XklEP
	OlJB8VYvHz37i9xUZA2R9RUwAWYzlZa+oOwRroQ5P7VW7TmGaaB0FApzyPIHtvPbqljEWDUVaPN
	3x/n8rfMoekWxpPDBckSGqIi3WRMzYeyiVDQxPT41mI+U/K+eYKAQf+iSugWr/y/aOcrX+Tl1w3
	zbDZm9FY25dNDuGqV6jNaWaaFRT5skPsQW6YEz5CshxXaL5ZfwFytaosIM3CmkgUX40YfU6PWWA
	jBDlYyU0gTLoW74vxz0U8E+lpNNRmG8aXma7Oh0EPyg/tCsTFDRsBODvDZOXfNRt4khGRpayFSN
	JrSLGRiKJgWR/Ou/uNDwbTLNspfcEatMH5v1IjSkgTtKMtKWejc2z71FuAbQwe9fwNMXD+bTo4u
	JyZqmARTUBYcDu/1nFT2rem6zmlAQNA/WaWRem9m9h+ziY5ckxAw==
X-Google-Smtp-Source: AGHT+IG1XA1C0sVrQukgqg2zfhabPGeEfBFq4PXjICHiM/1m71M3nPoNMMcyBtDYlqmHCgFgdMh60Q==
X-Received: by 2002:a05:7022:e80c:b0:11a:e610:ee32 with SMTP id a92af1059eb24-11f34bf7bdfmr15642369c88.25.1765994935236;
        Wed, 17 Dec 2025 10:08:55 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:86:f92f:a027:b12a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061a888d8sm479571c88.11.2025.12.17.10.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 10:08:54 -0800 (PST)
Date: Wed, 17 Dec 2025 10:08:52 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	pali@kernel.org, kuba@kernel.org, alexander.deucher@amd.com, 
	akpm@linux-foundation.org, johannes.berg@intel.com, pkshih@realtek.com, 
	hverkuil+cisco@kernel.org, andriy.shevchenko@linux.intel.com, tglx@linutronix.de, 
	mingo@kernel.org, stable@kernel.org
Subject: Re: [PATCH v2 RESEND 1/2] Input: alps - fix use-after-free bugs
 caused by dev3_register_work
Message-ID: <mu6hzf73k5updemoun7fdcgq4y6rvic3mghwpxpljm3j7ngkih@j5plzc3pjeie>
References: <cover.1765939397.git.duoming@zju.edu.cn>
 <b57b0a9ccca51a3f06be141bfc02b9ffe69d1845.1765939397.git.duoming@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b57b0a9ccca51a3f06be141bfc02b9ffe69d1845.1765939397.git.duoming@zju.edu.cn>

On Wed, Dec 17, 2025 at 11:00:17AM +0800, Duoming Zhou wrote:
> The dev3_register_work delayed work item is initialized within
> alps_reconnect() and scheduled upon receipt of the first bare
> PS/2 packet from an external PS/2 device connected to the ALPS
> touchpad. During device detachment, the original implementation
> calls flush_workqueue() in psmouse_disconnect() to ensure
> completion of dev3_register_work. However, the flush_workqueue()
> in psmouse_disconnect() only blocks and waits for work items that
> were already queued to the workqueue prior to its invocation. Any
> work items submitted after flush_workqueue() is called are not
> included in the set of tasks that the flush operation awaits.
> This means that after flush_workqueue() has finished executing,
> the dev3_register_work could still be scheduled. Although the
> psmouse state is set to PSMOUSE_CMD_MODE in psmouse_disconnect(),
> the scheduling of dev3_register_work remains unaffected.
> 
> The race condition can occur as follows:
> 
> CPU 0 (cleanup path)     | CPU 1 (delayed work)
> psmouse_disconnect()     |
>   psmouse_set_state()    |
>   flush_workqueue()      | alps_report_bare_ps2_packet()
>   alps_disconnect()      |   psmouse_queue_work()
>     kfree(priv); // FREE | alps_register_bare_ps2_mouse()
>                          |   priv = container_of(work...); // USE
>                          |   priv->dev3 // USE
> 
> Add disable_delayed_work_sync() in alps_disconnect() to ensure
> that dev3_register_work is properly canceled and prevented from
> executing after the alps_data structure has been deallocated.
> 
> This bug is identified by static analysis.
> 
> Fixes: 04aae283ba6a ("Input: ALPS - do not mix trackstick and external PS/2 mouse data")
> Cc: stable@kernel.org
> Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>

Applied, thank you.

-- 
Dmitry

