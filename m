Return-Path: <linux-input+bounces-12220-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E864BAAEE6B
	for <lists+linux-input@lfdr.de>; Thu,  8 May 2025 00:04:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2595D1BC7BC3
	for <lists+linux-input@lfdr.de>; Wed,  7 May 2025 22:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1755628DEF3;
	Wed,  7 May 2025 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzHyMzoD"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A461DD877
	for <linux-input@vger.kernel.org>; Wed,  7 May 2025 22:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746655478; cv=none; b=GNeRHsVEoXhC7qNXiOy3u+tFwfGRnhjV0sao7CNqkRmsIG7QHf7oYnmp1kB8w9VNAO0f5bwdn3798y8zqDUhlBsCFlqzozCUJNP0/VqnYd6vMlazmqj6coR/yqsZPaOYPxXJvGTnRZ19a1xAxilyD5P+BBe6j/jq/7IhI1uRCwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746655478; c=relaxed/simple;
	bh=MwOF6ULG2qev+Br1YKr+wpFfrdA9gLsf+yzyQX7D0X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FJea06nGFqiI48zxUu64fn6Z4IKaj4mLC3lIipHwuiLYSZcqxC1udGeKxOM5OK6Yv4YHc+O0H/GTXc3TrXvq7pmlF7c3HYpN+2aiZ63zD1KyWMnfxfcq97UxXVYSD4go8QqCKkOTAhgeNj0FgIG/Eu/ejWZr3X+ArhJogQCx4yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AzHyMzoD; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b074d908e56so176807a12.2
        for <linux-input@vger.kernel.org>; Wed, 07 May 2025 15:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746655476; x=1747260276; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+5aS2iYQsmFwtqxPKu09umb1XdWy1COGxgE9XNjkHU=;
        b=AzHyMzoDinoCpakxs85jWuNjngM4Sex7Nqddti3mUFYAOwAVSb8MNEC8HXn8hYXlCq
         JIUjkX5A/klhI22uUny1KbjREvNPWWvYiEdZHfdY2/Fi19lITo8ovRECsjFzimGQ/vBh
         XV7pVDbPjNyEp0Me/iHwGtHVS8AFDKmhHJLkiD8tRaUDkvoy2+SFsgPzwuk3LGQSEg4n
         LaA5yzKBMGDwNjoDzyI99tTauUuL7NL3er8HKPi/6wCG5JEs4z7jNh9bY3t/TGRXR2w6
         qjFftoNklpsZOpqxLbK8q9mOjVG033DpDPVpqwIoyWJ+pt4xuv4YwGhLQkRiLUdGEPYZ
         oG0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746655476; x=1747260276;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+5aS2iYQsmFwtqxPKu09umb1XdWy1COGxgE9XNjkHU=;
        b=s2uR7QRcv3oemeMzcUlhUqOHrUQlphQZDWb6WUFQNc3p/pX+bjxbTLFJmg2i0TMof7
         DYP9o5XpqVYkPErTact9ZHQaJj0P0m2Nzhzv0SFYt4wSbYp4VYE/TEvclO5dVYl/Psvu
         H7z7sYZXKSfxdZnj5uMnzc2YZwTT2457N/WLESOUc5UCwo9x4T6S3UmB7DnAS1UyHz7o
         1LkacYXeJOo4JP4ripIMTTQyu5nY3NE/Sv9ZSJyRdEJqDLpsMSZjD7MCICncryXHB/YI
         JnXQk+0Ch/hUPMPvM6KdBVAKfBYoSfjXnRf7OGWGJD+mTcfnooCmujf8mnRIbAXOWngZ
         8n0A==
X-Forwarded-Encrypted: i=1; AJvYcCW6CnoiJJ8j/Z1SDCi7F88L+FHP7xWUvaHhO2Wfjit8hHtn7Qgr4N6w8ub46uwxF46vt9yCWf2W79glqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoEEnViDgqbdA8Ga0hGP8yKxPLeNBuZyhWfe5P++dEm/NgDHgY
	zpMqeoQbLpPYWB6Rgoxwq+ARrVXbIYiinCyh416aQZzhaHmusyBL
X-Gm-Gg: ASbGnctsJH7cCbSIuppkeAFkVYd/3ZZnnYQPhziKRn1DFaM1Jl57ewwLgg00BTCE0MZ
	eVQm0BPMVWE2iWxWfFoO3p5fuZpqmrD6lYZpsnBf7YoNTKx1MveddC4tZz7PV73J7NZurwNGEgO
	KTx3rd1DJbATJ2yThWoPrrhrPruYI9bZdMR0lkBJ8+PdRRwfoISC9I08AA13+GbZkK0EQv9lMth
	HBulT6wDUFNw88Xhof1TZFYYXtHW9H7sTh4Vww5sJIL0mcq4ObeYxgvcYju3LTND1HifycB5614
	VXc5mSmTJe6f9WSlmbj6rhV1Za1edUrF7wd5a7bL
X-Google-Smtp-Source: AGHT+IE+xCk3cUuzBBpeuy6DGWPXoGy6eNT4bH7kRM3lgkNB/pNAJ9n4nfiMzmCH0Q2GLpvYy+K60w==
X-Received: by 2002:a17:90b:2786:b0:301:1d9f:4ba2 with SMTP id 98e67ed59e1d1-30aac21eedbmr7449750a91.28.1746655475696;
        Wed, 07 May 2025 15:04:35 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:fe5b:f2b0:d1f:f5ac])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffa2b3sm742832a91.44.2025.05.07.15.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 15:04:35 -0700 (PDT)
Date: Wed, 7 May 2025 15:04:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Aditya Garg <gargaditya08@live.com>
Cc: jt <enopatch@gmail.com>, linux-input@vger.kernel.org
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
Message-ID: <76uppy6gn3ue25bctoepxyxjlwz6uwjyauqgi3oezdsmoh5ifn@vguq6fua2mee>
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com>
 <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
 <PN3PR01MB9597495CD169A3D918466E7FB888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PN3PR01MB9597495CD169A3D918466E7FB888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>

On Wed, May 07, 2025 at 07:49:32PM +0530, Aditya Garg wrote:
> Hi Dmitry
> 
>  
> > Peter, is there a way to add a quick based on system info to libinput to
> > identify that PS/2 device as a trackpoint variant? Unfortunately HP used
> > the same PNP IDs for the main touchpad and the trackpoint...
> > 
> > As far as the main touchpad module goes I am about to send out a patch
> > to add it to the list of SMBus-enabled variants. Would you like to be
> > credited as "reported by"? If so what should I use as name/email?
> 
> I've sent some patches for other models reported here:
> 
> https://lore.kernel.org/linux-input/PN3PR01MB95975989E919EDEA7717BF89B888A@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM/T/#u

Thanks for sending them, I picked them up.

> 
> I can send this alongwith that if you want. Although I'm not sure what
> IDs to be added, since there are three in this laptop.

No, this is fine, thanks. I have it.

-- 
Dmitry

