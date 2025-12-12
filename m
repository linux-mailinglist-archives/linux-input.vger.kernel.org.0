Return-Path: <linux-input+bounces-16549-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C4DCB84F5
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 09:46:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9407300A25B
	for <lists+linux-input@lfdr.de>; Fri, 12 Dec 2025 08:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E3F212550;
	Fri, 12 Dec 2025 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JHYuCuh1"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38A542D77F7
	for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 08:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765529213; cv=none; b=cOqehd3rWqANZbs4f+vD0ysuaxllpGVcwYyegzxprYULbjX5bE6BgMsqyRQ7KHXQY8eT09njlpIGsK6psIpeSZ/hUr3WnfRJo0Ig1/W8TaAGpagpxTdYOGObCccq1i2pvx3H/oCq133q1O6C6o5TwuTO5oMtWODzBtvFMVd2mU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765529213; c=relaxed/simple;
	bh=UUz9FBZ0VjTdrrNvYZ/9wuunSrYYvwDzroYxL8D0MTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxkD3b9KJ+/YAe6wUEecn5bqiwH1451FBypJDOGgTdoyU7BOEeL1/oDbHYC4JWGrCI8wzSWGvCT1XyM/RnYefMjQl6GfHKuqNw0tqnkwFId7KoodHSue9Da2ju/M48oPncF87+EhYUTSRzIjShMUfvL59nSQ9XCehuGbR5yw5ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JHYuCuh1; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b553412a19bso850005a12.1
        for <linux-input@vger.kernel.org>; Fri, 12 Dec 2025 00:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765529211; x=1766134011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOyh7YwZ/fjOnqsi8in+FWH0IHyn2UOzmxthtzGPDGI=;
        b=JHYuCuh1zc4VZaWVD1HHlKVfYLMThJVsoZ5IDRaXRYmRzFhgT7o1OxwJ9Vx2Ul3Wdy
         IM8Q/jz1TTBYhWUJaZfw6FbOvaVJEOMhWDVPoOjAG+GAVlnzWsLXij7kP2Stsx8/e9JH
         q5wUscZRXRf4vFi2bFUOTG3T5syvset9Qdc273XGefIuTo/By6HZ6PuZpJQOp/FrSFzP
         Sbxf9Wn0hcKoZFoIjntNwd/7O4Xi1Pt77ACu9OIVoZ08RYQgWQSLTvgeFkX+AhoWXV75
         DYL8fr1svP1l3dXUCXIukKSW1LQnnymyPpPWYZZLGfXkoaK+pi340Kb6/OMEtosV35ll
         Gpdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765529211; x=1766134011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BOyh7YwZ/fjOnqsi8in+FWH0IHyn2UOzmxthtzGPDGI=;
        b=MFL0eUEsu88fUSqX+OAqdCfd82ikfwmAJskYEr3+nNmWCNJyCj3dH1M4Ty+TRrllEx
         vxjNWGpXB0ZnLE/THut3NkJDi4/s1qgCvGsm5GKcHWjiuLH3l52OcfI4qtNY7jMfAtrW
         jafz9zo1U4/hOUibnzNCGHGW6cfysw3YIgw0dzeX9Io9aC7RCiNPWQAeH+XVYJOaw0tS
         jp9+zZuasTpjiQH3quECR3oXmdIrDV75xEg1ObvZlK9ygrVtKiMAnPk2CGiISbHEVlzm
         nL6eOhLQVM3p6NEaKkzezq1x2OOlY12dneba1TyPu68CI9pVlzPKSpWjarFjm12z7NA7
         rYAA==
X-Gm-Message-State: AOJu0YzTP4y8d4q+tOa/8lishoPelRmojYevcQv85kstMAH2Ha3ygk4S
	cOiTzqIXo1JGnR6NyXfxAxCqGEftVX7fi8gPudnSSZZMYtPbEjtDdIJ9
X-Gm-Gg: AY/fxX7tKdBD5oN3QFh0NE7OS9n2w476BrRntL2K9cNqOQ9AdHxxof/jq1i8FCYryEb
	aVVFOU73sEp60oPILwQLgQ6d4rxljPMRsfxiKfwd2DA70uDNpy+D9fbsx8gn/HjRep9JRyxB2PG
	Xm+PW/XOKZvE7HFKslAWV9SoXA3uyL4TS4f6FopVIIKE+67mGby82YfaLIjUyJSuNmi7+85apj7
	dDphgs/Mqp1nmMTcUDnLbF9rmqS50kQYAn8lDL1FsvEFXiE33l+XCXNF4Zpr6qZLi1fd3jBMvl/
	g0lEY64BNMIlktLpMsbXzKaGbSM78PTg9tyvDlmiIifTzGsxcdGddcINhLFBsQDCHHkR2vvraY9
	sLeGSWdjepAj9Q7JLu3rfKfxBfKbKqueSXHb8Bj5YhkjxomWlS/i26HddOzO1KQL1Ukmz3uoDzI
	Iuo1hxuvROMIaPRdvsO4GYynlwzRGnsQWedY50BBAKzWtnCpD2INw=
X-Google-Smtp-Source: AGHT+IFxRnn2Hnk3Fy94esqvbow5sOCCjS7YFOHFngABs5YEgFMaD0CbN/JFTsoo+Ygy71nEbS4+iA==
X-Received: by 2002:a05:7300:d10f:b0:2ac:1bb1:68ed with SMTP id 5a478bee46e88-2ac2f85e863mr1040229eec.9.1765529211350;
        Fri, 12 Dec 2025 00:46:51 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:fafd:f9bf:2a4:2a0b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e30b799sm14228199c88.17.2025.12.12.00.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 00:46:50 -0800 (PST)
Date: Fri, 12 Dec 2025 00:46:48 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Minseong Kim <ii4gsp@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH v2] input: lkkbd: disable pending work before freeing
 device
Message-ID: <tquiwnxvffkbxw6o4x66w53cujhkitzlleemwzoidgtjhxwwsr@ojotqpywkfwc>
References: <20251211031131.27141-1-ii4gsp@gmail.com>
 <20251212052314.16139-1-ii4gsp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212052314.16139-1-ii4gsp@gmail.com>

On Fri, Dec 12, 2025 at 02:23:14PM +0900, Minseong Kim wrote:
> lkkbd_interrupt() schedules lk->tq via schedule_work(), and the work
> handler lkkbd_reinit() dereferences the lkkbd structure and its
> serio/input_dev fields.
> 
> lkkbd_disconnect() and error paths in lkkbd_connect() free the lkkbd
> structure without preventing the reinit work from being queued again
> until serio_close() returns. This can allow the work handler to run
> after the structure has been freed, leading to a potential use-after-free.
> 
> Use disable_work_sync() instead of cancel_work_sync() to ensure the
> reinit work cannot be re-queued, and call it both in lkkbd_disconnect()
> and in lkkbd_connect() error paths after serio_open().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Minseong Kim <ii4gsp@gmail.com>

Applied, thank you.

-- 
Dmitry

