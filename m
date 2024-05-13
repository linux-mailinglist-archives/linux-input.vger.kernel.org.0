Return-Path: <linux-input+bounces-3695-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D178C48C8
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 23:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02EB81F22C55
	for <lists+linux-input@lfdr.de>; Mon, 13 May 2024 21:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02B5E8286D;
	Mon, 13 May 2024 21:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="me4zizEK"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFDF80632;
	Mon, 13 May 2024 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715635472; cv=none; b=n+16VkGykQOlv0DoDRz7J1WGs3liEUwUaB9Jy2D5uvPxNcIIpHGO8LLR//7uMtK0pokHfTetq9DJ0g0hSTKvXp88f7MNL1s6klT4nJ8SJAPnkLoAgX1oo/exkaczn33V1gXGCF12esPUpHZYeu5ogJIntEAPs+eAGPfycr3pFZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715635472; c=relaxed/simple;
	bh=g0tquPyBnB9ZKUWCbyY2Gv+Ch+/IkbPiP2fjbFNt0M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/0QENHrqip4CDUhfuOINYbtDJ8bszWoluBnIP4FONK/49OHc7maKKsoZMqUGgQ2JpyQxfn+XFVZDtdxwfwsWw2p8HZFUMMCkrrRKCynmq0ithJlJsYX9+q3OWV+ux6GSkkUEoPA7yesVbEnnagR1vANMyg9YNNn+QETUhB0vcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=me4zizEK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f45020ac2cso3759911b3a.0;
        Mon, 13 May 2024 14:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715635471; x=1716240271; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tkebl0jBAL/LeiWK6znMTpewl2t+3gSc47YMeKJXsfw=;
        b=me4zizEKcdXtMfyvKKIDRKee8LiH4v7/AoLUhnEthlDa5qeWy9p9As6EXho7OhXFH5
         1Bk75R9gSbn6y9VCeKAXiBDBS2Adse4Lntn4a0q/ESTiH5mnzB5EThUU6aQ/AtjOILw5
         cCvJR/cLQb+zHocrrQ5h4iIRQpc+NX/U0xd4lXHAoysjewLIOaB/4Vi4LYT/UhkO/Y7Q
         jNib7N1hSbCxO+lsdKtg7YQmjUhGwG5QLJozkbIizgT2OdoNygULmQie9nmN+IU9Yyy2
         EXbx4JQwUJ2KmBGUFYquY8qeiuJ2rFc6UUQVxcWRf5UVfC1q+ZBS36Ts8n6ZkP0CmF//
         ekXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715635471; x=1716240271;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tkebl0jBAL/LeiWK6znMTpewl2t+3gSc47YMeKJXsfw=;
        b=H08NMVETRyeci6OHhmzzz67eC+Ma69RwB9E2mjCeS3YSwxfy18GaWfTpfQVezyRREt
         jqld88FTYCAG/yf73WTHa22cLKM/e/77Qmoqb1fLAvHtQvf1jWE5UIWtAMU9dQd+K3r1
         rktYUOXZlOxvJgTYkNbWCA3NOaSJhspGLMPU3t4WX5CBf120g9BiZmLNeX84lyBtBn6o
         HiqKNSclMCGkDIgTZnGor76rJa0qa/TZi6kaHjq84wjQY9mIv3qvxX1cM/Z3v7bheHoF
         Chv843dGNDX6fqHzcAC2aNLt2ByzaR8xjxXH1PgfRjm5PxqjDhR6d91cImm/MmovtmXu
         4IGw==
X-Forwarded-Encrypted: i=1; AJvYcCVFe6axg5sCYm+ynvCqrWdfbDlH85Rz0L+OTpB8heGN6UwlUQZwBOoRzdzwqq5kQGLrZBp6UHYjuvvVaoBjcVMs4aEHKwU3Z7YFh8W71k9w11p+D/MW9X4aQSgDxExZXpUsU8993lSkZ5n1JkMoPKLD1yj+EUCGA8Cj6dXJO2eGgjm5cbPdvSxV/XY=
X-Gm-Message-State: AOJu0YzJBIkOH5Mpj7FMftz8lCIbfuvfMdQpMhTD4vWQlueyR5FR2l2h
	pBBYoap3YFpO2cQ4xg93RnAICbNCSoQLSS8BYdbh+HvSCRO/I+WO
X-Google-Smtp-Source: AGHT+IHRNDn3oPqmpTkW+LMyp8KJezXOHQDR+hYIcNBlq+zvA+bozIPOtynqB1zQV0sXgjyBl1uniw==
X-Received: by 2002:a05:6a21:2709:b0:1af:d240:2c14 with SMTP id adf61e73a8af0-1afde0a9c02mr11177149637.6.1715635470821;
        Mon, 13 May 2024 14:24:30 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:7704:86a9:2c56:6794])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6340a632608sm7172489a12.5.2024.05.13.14.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 14:24:30 -0700 (PDT)
Date: Mon, 13 May 2024 14:24:27 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: chipone_icn8505 - remove an unused field in
 struct icn8505_data
Message-ID: <ZkKFCxnDHKpF1_xb@google.com>
References: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37443a675ca07c91c5f0118ce255406e6e3c08f5.1715502304.git.christophe.jaillet@wanadoo.fr>

On Sun, May 12, 2024 at 10:25:17AM +0200, Christophe JAILLET wrote:
> In "struct icn8505_data", the 'wake_gpio' field is unused.
> There is also nothing about gpio neither in this driver nor in the
> data-sheet.
> 
> So, remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied, thank you.

-- 
Dmitry

