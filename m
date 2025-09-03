Return-Path: <linux-input+bounces-14458-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB408B4240D
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 16:52:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C86F189C275
	for <lists+linux-input@lfdr.de>; Wed,  3 Sep 2025 14:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E8402FE071;
	Wed,  3 Sep 2025 14:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBYkr1Wd"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ACF2FC887
	for <linux-input@vger.kernel.org>; Wed,  3 Sep 2025 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756911116; cv=none; b=QOssBkBAPVKKsotH4WpwAMs+W0+t0ARmvOZ82TGmF7Gf92wqvoEJx+oWQmFV1wMiM5a8kEi1eXZTxMYmOzMd0mJLyG4d/JTJe+BrQxN2/9n8bzdB7cgPj31mztkpCzigcQ134UrklLe5Mrf0klz8jgV6dmBFxYi/CMkDiWl774E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756911116; c=relaxed/simple;
	bh=LZDfei4FFIg/EuDN8fTKNxJbG3HGegSNiumbNoPwGKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnRHG0sVcCSeUp5UJ0y1Ln1+TFDhRhOOs41Wjhf6ZomRs0ksC5zI+gO0cp5Ww4/hd6S9Tj8+Mb2LA0fOOcKQkvdQfkf4tByuy9QV31F+Bd5S+3WA0MmWIHtK+ZB7C+Z1jEZlYSN8rZmmEnbmBq1ChAwT9rQymbx/OS9ttkzN6QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBYkr1Wd; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7728a8862ccso250527b3a.0
        for <linux-input@vger.kernel.org>; Wed, 03 Sep 2025 07:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756911114; x=1757515914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AbMZ/Q8QGJG11dNopBpIeOiSRoTphKQiVZKdLaNGimQ=;
        b=HBYkr1WdPviGFf3ggGXz4JstwDKPkfnQJ5ycmnBRl1oSnIdV1qFAYrftgN++I+PB9l
         Ggz3aCfkkzm+jf+kKU69ASoGcnjBEnXp79LBnOJ8pVt+0Isg2RXtnVmDzmxYF5/ZJ5lv
         2hOpD+28KPIj3jtQu4OwjfPHL3eamZX9/JlGRZZgd8m55xnPxjVkAoCDeqgop1hhI7sG
         bANeWnGvj9g9VrTSGnetWsXlLxKDFJuZ6UhN/q+FkapN2vCBSGOTR+oqmbxgK9b9O8k2
         7WxE7Mebox7kfxkd7Hz6ZjFUBeyBSkcP5IRZyY0JFjfHY8ryk+iNMc8n3sOdFEEklJyv
         XnYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756911114; x=1757515914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AbMZ/Q8QGJG11dNopBpIeOiSRoTphKQiVZKdLaNGimQ=;
        b=LsuO9YDblAzP4x2jfvSnAwsBILITJVom9++PoGYfJAMW8TqDP5fxSUbbmUGu0QK/iJ
         zuV3E2aS1n3nFzTpReyYYKhMQdW9SsmpyNFCWqdl7Jf+CPs2dUhCjiDxIccDgJkRzVKB
         kxUSqTQCeenCYpHqmVyHhlgy6WthKc2NUrQPcXtYxA5oEWb+F+F755R8M12eL7kEgFAr
         MAU6r7vMU9ypmr5Udxg6diFBEnExNtPJOyM2vi3fL712qHtbGTx3s6P5iDu1ljrtx9qf
         XITajl9edSJd3rg6b0w4BB/9JDQCXA4kKPF+c4dcz1UvlFGDE4mU90GKf3DsAQ2/QrEn
         jU6Q==
X-Gm-Message-State: AOJu0YwVdQaq0jQAJBof90p8mUDksz+KdDFTs+xafctma5onz3bNNWJ1
	vI5SyN3b8JRgYasR2BF1b4IXqqmKYO3/hc5qGlrBGPYajbIkMyIINxV9
X-Gm-Gg: ASbGncuRDiTS28N373WJHYN6LUahfDOdYab2sbYxVhhXPuldvFYLjt/cI+q5W5XzdPN
	oKhP76HmJ1uj9Hadvvy+GsF+UoB3dAwehPi5fqTQ7f/NqmE6CDp66vmWOFidGqEuU3uGs3eOzov
	DJ9wCPMQV0pCvEAu+Doa84ptBXkYZr2b1wGt+ZJ+6I86sa/j6VrixmByqcoXdT1SKkXvyDwGjfy
	dq67XDaBFB2sPKKkF+tXXsgu6sw57Fr+ORijbFXM2VgJNbyT3B5OlYnF7/EKUWABEixlkBewRyH
	eck1cjpdAtLcO6piA2iF+wkN26m+DOM27ynPVle2VPW8FefniVacq9uLBA42QveLAGdzPr7eZ2h
	9AnQnI2wwXpX549FlEMhtiEQ=
X-Google-Smtp-Source: AGHT+IEa5dTtzdbPpLco2AArBzFI8cgyG9cANmzTEJaNnCBLrkcKG3LigOcX0Uo7EN0C3lpd3sjWeA==
X-Received: by 2002:a05:6a20:3c89:b0:243:c287:5371 with SMTP id adf61e73a8af0-243d6dfbc7cmr19010832637.8.1756911113899;
        Wed, 03 Sep 2025 07:51:53 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:dde1:b1e1:74ba:18b3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329d8ca7aa0sm6246758a91.19.2025.09.03.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 07:51:53 -0700 (PDT)
Date: Wed, 3 Sep 2025 07:51:50 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: mailinglist1@johanneskirchmair.de
Cc: linux-input@vger.kernel.org, 
	Johannes Kirchmair <johannes.kirchmair@skidata.com>
Subject: Re: [PATCH v2] tsc2007: prevent overflow in pressure calculation
Message-ID: <3mdnnw5xzynrr2veeedj6hnwcgyp2zqjcc3u5krnalqaxni2r5@q3dnbkq3baqn>
References: <20250129-fix_tsc_calculation_overflow-v2-1-9e51333496ad@skidata.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129-fix_tsc_calculation_overflow-v2-1-9e51333496ad@skidata.com>

On Wed, Jan 29, 2025 at 02:51:20PM +0100, mailinglist1@johanneskirchmair.de wrote:
> From: Johannes Kirchmair <johannes.kirchmair@skidata.com>
> 
> The touch resistance calculation in the tsc2007 driver is prone to overflow
> if (z2 - z1) is large and also x is reasonably big. As an result the
> driver sometimes emit input events even with very little touch pressure
> applied. For those events the x and y coordinates can be substantially
> off. We fix the overflow problematic by calculating in a bigger int
> type.
> 
> Signed-off-by: Johannes Kirchmair <johannes.kirchmair@skidata.com>

Applied, thank you.

-- 
Dmitry

