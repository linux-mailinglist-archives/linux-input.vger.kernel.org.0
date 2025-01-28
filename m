Return-Path: <linux-input+bounces-9597-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 610E7A212D2
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 21:04:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A99EC1885883
	for <lists+linux-input@lfdr.de>; Tue, 28 Jan 2025 20:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7A2B158A09;
	Tue, 28 Jan 2025 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNArdw4V"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FC029CE7;
	Tue, 28 Jan 2025 20:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738094686; cv=none; b=nhfAD7vJpF1cpj1WnLQBlo1iSiieHU4LAVbUmyr9e/GHgDNcsihsgA3xOCQx73uxgVKzC2wZCNGSCt5mtKkBlsJT7UpaCo/rdWeL/lMnfQLJOqd304b/ODbFquDBw4EsTb6VI0Vf/JJaec3/7N4kIz+/IQsAqHz8Ot7FU63OFZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738094686; c=relaxed/simple;
	bh=Dw3EBZel/atgQ98m82teBCg0RmY4V6owPiBwvQmEzLs=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:Message-Id:
	 MIME-Version:Content-Type; b=s27LTioFjP3q/OQnld+JR1jblR8/+5yyRUxKN+ztRSJyKzDsCTgbb73GuRk5P6piG+lapqtGQDUmwbDoY8uJhZyPCPNOlWNdG0kyy4zx0eO8SJh+Frin+GHvnRcXao27yFmIW0nA9xpt0aAIPozaupglO6bKOMwQYYnrOANiklI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNArdw4V; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf60d85238so1019842966b.0;
        Tue, 28 Jan 2025 12:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738094683; x=1738699483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dw3EBZel/atgQ98m82teBCg0RmY4V6owPiBwvQmEzLs=;
        b=NNArdw4VNpTg+SvFPB7Ub0IiAQbKSNrZik9t6VWvJpBVIifDzPkeV0r0IvH2sweMfY
         FUjjMat9a9D3nR1q7dhfQLqtBTttB8PozLGbSvdMqqyUx+4+miUzP/HdbQiw0PhjKpEZ
         ArydUSvVlgit3FGlJtY1AYWxkjCJD32yTtYp6pO4C54bf8J4u7FdreeRpJJoICw7g9zj
         IxWJPyIo2jnWPf9q7qNN5O1JXf2ywSQavoisy2NyVaW6lIYQDpyXX5LNnrGb+OZBuD4x
         dxn7rp1WKIrRVwv21oiIh5X/uXxQJ5sX+NqR1aRH6J824t5GeuhaskLyhKVru+VKngyI
         nmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738094683; x=1738699483;
        h=content-transfer-encoding:mime-version:user-agent:message-id
         :in-reply-to:references:from:subject:cc:to:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dw3EBZel/atgQ98m82teBCg0RmY4V6owPiBwvQmEzLs=;
        b=FWCHy9x/0lyDsdSBxpsxbIVkg+w9cfvK/cdVeyVR1kNnd+fPWoQ06pl/NFAa/FrnLr
         AzjgUbGwQog1wmCDe1yGK/P6vbwXshug3Yh3GBsg3Zi60EMWJqtqBKE7ZjyJlOJ69JCQ
         sXaPqf5lH+EcVCnp+epjmY/00REf7Jj6M4hiON9FdS/+ku6gcgs7UPGyTJu3KJyclhri
         RxUzH/SywC7CdP/Wq1lG/ghNNbltjOR9/WsOlFYJY3pIuoXnNBINefh3zCceJBbg4KrX
         eE6jHq7cYebfGaTx03KcjFtu6dn80BifoBIvVxiL+uKz1yW8eaHzICMbilq/XAm7OjNN
         /BzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhVV3uOoZbzO5qPew429xYfNJG4SY7LcRbQffQqV+OTH0pt9tzkc1mLrEhiuVPQs4IVCuDl1m4/DMH9Pm4@vger.kernel.org, AJvYcCVDMhFJFTBwrIK/NWf5S/+irl8ZoRw4SgG3dguGbhW6K0bKJYU8wiQQ+U9/xj+3xdnYWJha5JDe4ZGP+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwV+JVWOJUVNnqGJ99OdSRksEBGq5CQXAeBnk5oyDy97jFejU+c
	FnjYP7f01pNoWmTjjc8w01nn+tSs+9agd3bKsHfyudvsHP/mJ1d2pQ8e/ccH
X-Gm-Gg: ASbGncsM9yn6p2XYI39QQ3fu6deR7EE6OYKwYIHu1IDwGMnHOhPQIaIv1bA+NMM42wN
	mbWNq+IXIEioyuQpgtLY0qUBfMt3SOKu1Vhj02gCqq+KnxWBsJmduDz5Qqs1gK7iKnXH1+QO++V
	BwlIUxxR+nIBst/V/D6IDnu5u6U7XDAHftJ1jAjJTetWHz8zMuDbO38NGuHWHbXoY8PIpp/2Pn5
	BXazy9mo15+FTWUgVXc0F8M/n1CQwBOZx8mVJlfvIw50J4eXIwcMhKIa19/wZaKelxpPu6QhyOe
	bbIBmVY=
X-Google-Smtp-Source: AGHT+IFiwstnmotK/U8vd+AYc6NfuqtBYqItjR2hnyXwJPxfzkDG/Q84rzLR8CyEhlLh4lHRCQ0Iiw==
X-Received: by 2002:a17:907:97d6:b0:aac:1e96:e7cf with SMTP id a640c23a62f3a-ab6cfcdf2d1mr43574866b.20.1738094682931;
        Tue, 28 Jan 2025 12:04:42 -0800 (PST)
Received: from localhost ([2a02:169:1e9:0:8f4d:9ee2:cc35:c67b])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab676116ad6sm846801466b.176.2025.01.28.12.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 12:04:42 -0800 (PST)
Date: Tue, 28 Jan 2025 21:04:41 +0100
To: Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: djogorchock@gmail.com, jikos@kernel.org, bentiss@kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernelnewbies@kernelnewbies.org
Subject: Re: [RFC/HELP] add support for POWER-A/THQ BDA NSW Nintendo
 Controller
From: "Silvan Jegen" <s.jegen@gmail.com>
References: <fbjhelddqwf6yenezqqndihm7sebehpg4cubdwktxyw2nnirrs@2yz7fahu6nr6>
In-Reply-To:
 <fbjhelddqwf6yenezqqndihm7sebehpg4cubdwktxyw2nnirrs@2yz7fahu6nr6>
Message-Id: <35EDK8BDVWSCG.2CILU67NZJL48@homearch.localdomain>
User-Agent: mblaze/1.3-4-g04d14c4 (2025-01-02)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Ethan

Ethan Carter Edwards <ethan@ethancedwards.com> wrote:
> Hello all,
>=20
> I have an unofficial USB Nintendo Switch Pro controller that I have had
> for a few years and want to try to use on Linux. For reference, the
> vendor id and device ids are as follows:
>=20
> Vendor: 20d6
> Device: 0002
>=20
> I tried adding the device to the hid-nintendo module to add support but
> that did not work (see below for code). I recieved a few errors from dmes=
g
>=20
> nintendo 0003:20D6:0002.0011: Failed to get joycon info; ret=3D-110
> nintendo 0003:20D6:0002.0011: Failed to retrieve controller info; ret=3D-=
110
> nintendo 0003:20D6:0002.0011: Failed to initialize controller; ret=3D-110=

> nintendo 0003:20D6:0002.0011: probe - fail =3D -110
> nintendo 0003:20D6:0002.0011: probe with driver nintendo failed with erro=
r -110
>=20
> I understand that -110 is a timeout. But I don't understand much else.

I have tried to write a test for the Nintendo HID driver for a while and
think I have encountered this error as well. If I remember correctly,
this timeout happens because the controller does not respond with the
reply that the driver is expecting (or at least not in time).


> And I am not sure where to go from here. Any suggestions?

I'm a newbie as well but my understanding is that you would have
to figure out what the controller is actually sending back and how it
differs from what the driver expects. Then you might be able to either
adapt the driver accordingly (if the behaviour of the device is similar
enough to the official pro controller) or write a separate driver that
can handle this controller ...

Cheers,
Silvan

