Return-Path: <linux-input+bounces-5206-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B636C94091B
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 09:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E74EE1C20B41
	for <lists+linux-input@lfdr.de>; Tue, 30 Jul 2024 07:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2055854774;
	Tue, 30 Jul 2024 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DDds1kO2"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB047161914
	for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 07:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722323449; cv=none; b=ZfD08SxF/mmQgYB9MyOY0ri602KzFX1yDxlbVuNLiom8tms1dVLcOix+zathvGwXFw6lLDXsFRwCIm4OhTz8IPWqy//b0MYU1nPAOfYW40MOHwqrEAfOYF/SSmGsZVvlihTSRZwb1x1+JT6PfyjP0Y6Td6vDlOsv77PEZr661Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722323449; c=relaxed/simple;
	bh=uOvq+MhB4+zSd/Vt0H1pnDvcLKpcwozIOQ5FrDJDE2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=sMh556MSiPN+fsCw6/guoTN6X6+6OvEC8GCW/zSmz+tCNFgqEjryxyBInryHCmj1ARhMbr+2qMQgQURxWndAt1taeoru4XfbMibNDM588fxAG/egwzndeRwd3zwNmXzsVavDwLxmMTBTsbpqAZ96M5qJu59Mn6AJqlPJxBvFTjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DDds1kO2; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2635abdc742so659728fac.2
        for <linux-input@vger.kernel.org>; Tue, 30 Jul 2024 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722323446; x=1722928246; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOvq+MhB4+zSd/Vt0H1pnDvcLKpcwozIOQ5FrDJDE2c=;
        b=DDds1kO2xfPevh6cWVVOI9/e1gd3vVJUHt4DiZiGxyMSgAnsNxLtVQ50JmPfd0NraP
         aCN/jjGo7prikd85ZZhXq/WPPW8MIVzJt2xL1lUKGoHvtQmMNTxrxyJyY9BcqMNem0Lu
         vmurBrYue5XYS8nnyLTbn58NivY4qHL59PnjVDx19HQ0OxUTJnM2dgCmWTu3PNfdliOm
         odYzAGovuPGbFa0ciD8skIzruZelsBRPtyh3hqYEBy6v7d2vEBjgIeIQwZt4cS3kJGzs
         RNySAF0ObHVXAV8mCSZkE4/rNKHhp5lDmqY+eu+qhjx30C4/mzWQiF0rh0mj5qAtPvf6
         qGRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722323446; x=1722928246;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uOvq+MhB4+zSd/Vt0H1pnDvcLKpcwozIOQ5FrDJDE2c=;
        b=vea14YgJmo3Fm2tDY9FFhsyUMSgpZG3UfvYpwavtPsquoZWZfupe3tIYceZ/8Ok2P+
         URFNopQ6dBb3DN5CMinAUlG5Y+oRMF0QvWVbJhql//aw4a1wPptGd9xSNiB6Sy2A0t0S
         y3E3sSIq7YL2XXCFQSSMMkXSUv8RQd33UAXE0HYNWwD+MZY/ttG96iEYqnCssm/WiI/m
         EH+zt4iqm/rEHrPZzJz7774kLA4/BIOFv7HTAwJOMRTM0QFfMXnclnS/iBkLQSOtIxVO
         XRIvENHSeCIBI8dnc05ZHsbij0mqfAiV/sdPE3Kkl6iwQrKJj83dUNMtg+fTaI7z7Utl
         YpGQ==
X-Gm-Message-State: AOJu0YyNM7wyUzz2i9A+v2q9zroOKjoNJPt2G7U7dQhChj+C/NeiI9zH
	/SaxvibjL2YFNfhO1tI+gK2iHAPKMm/PLs4BT1jCyLaXBtzZXApgATFk5syPNYmHCC277c6BIAs
	MAm2yi0m+L0SDmCt4mWf5f7yfyo49hw==
X-Google-Smtp-Source: AGHT+IEm6ZW/f+AzNc01zkSJdzTLsp5MKs0eTgfNhnj266iSNqnxnuvmZY55xlA4ozR8R63Af5poCstsOgdlCQn3Hrg=
X-Received: by 2002:a05:6820:1050:b0:5cd:13ef:f4ed with SMTP id
 006d021491bc7-5d5b15610e0mr9214982eaf.2.1722323445906; Tue, 30 Jul 2024
 00:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8cd6293f66f9399a859330a348c79fa3dacb0202.camel@gmail.com>
In-Reply-To: <8cd6293f66f9399a859330a348c79fa3dacb0202.camel@gmail.com>
From: Alexey Kuznetsov <kuznetsov.alexey@gmail.com>
Date: Tue, 30 Jul 2024 10:10:09 +0300
Message-ID: <CAO1Zr+rJsSr=d7Zimgt=NcH6uo0H=ajqktPATO_ciVeSp5W40g@mail.gmail.com>
Subject: Fwd: asus_wmi: Unknown key code 0xcf
To: linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello!

My Asus Laptop (ASUS VivoBook PRO 15 OLED M3500QA-L1072) reporting this
wmi code everytime I connect power cable.

I got no key code on power disconnect.

[11238.502716] asus_wmi: Unknown key code 0xcf

