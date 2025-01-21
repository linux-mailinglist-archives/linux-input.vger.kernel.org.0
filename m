Return-Path: <linux-input+bounces-9407-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD1FA1767A
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 05:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839173A8FCA
	for <lists+linux-input@lfdr.de>; Tue, 21 Jan 2025 04:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84AEF1487E1;
	Tue, 21 Jan 2025 04:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WebFtP4Y"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4D014D2A0
	for <linux-input@vger.kernel.org>; Tue, 21 Jan 2025 04:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737433251; cv=none; b=coWPL5x89x2SvcT7COcu1Nb7OvUqi7XukT39My1xZbmvb1lsJhsRJoHp77E0eI0AdQ6XT3lSAI6fgLl7cpxHoOstVDgVSRhT2LwJ40m/F6FNm5IQwoQos7eV+P+u/V1r13eVHRy4vKbKaKbcYw7xEpj0NhqxTBwSXCtuSvlKOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737433251; c=relaxed/simple;
	bh=2CF/61ekkv1XxyJcqAgP093RXnBfOK+0fum0+ubvnS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F0XkqdVxmY7gXubX22TZANv4KfeVf7/GGBTB0e16MXMZePxe6mKw+vs/OTl4ViQ+NMsh5nueL9nZ1sgIJz9UHpQEa9tzrQxiUekv82sRal4xn92rXp37N9d7KmnrqfqgiUhjQOLlWM0NjF/55jitqDmrThHh6/eAePi1TNjoK3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WebFtP4Y; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21628b3fe7dso89160855ad.3
        for <linux-input@vger.kernel.org>; Mon, 20 Jan 2025 20:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737433249; x=1738038049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+WK3EziaIL62pEhIphiFfWoYTn+8YaGVVx1J5LwMeo=;
        b=WebFtP4YpvoTau0+xHxQg9eIeip8LBybdcfW2thNZEQz4pZERF9Q/nxJIf4q8nLK3D
         /g5KsEqPeizDC0i8cmREt5c+CcYfNwWyukcGzfwQnNORR9A2zkQADh6MPfc5Ys91c5gl
         xr34k+Z8YmPe3KW5YLvFZFh09WziKN4dD1C3NHUHD4lwgVCfEHqH0xGOYy/U6/Sbp5F2
         PKU/I7eO7OWl9BKPT27lV+aEzYLmugGDbD9Ch/b6qE7G3BBOVIFB+Zv+7NznZNfRXKWQ
         HCYlEaZVEG53YKNjKaMp5WTNhgXTF7Hc0txf48OYi+9wbkGkO7sMgvehjpVjtzybRRCa
         egfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737433249; x=1738038049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+WK3EziaIL62pEhIphiFfWoYTn+8YaGVVx1J5LwMeo=;
        b=TjmOkIJtuoEfWONVSdiWYHKL0PqashJd4/moy4njSTwCsvcXAhIg30Az+72ZFmB3Yy
         pvt56eXH5xWKtTeYHlkBvckxmLwNfH8pbbkG9gF2CrXqCAYCpV2b7dFCmkQi48jttXTJ
         eojx1kUYDC54Pg1twl6P0Ix/q4Nch6SZg7kW5NXdFV84nrV8PGuK2xuTGqhQjxK7QukY
         e6X+FxNlsyr62iwmmUzMJ30KnuITx9DRcKQ3GR7ZIP+xXKKtVTblkaq7Mh4bUmAzH4mm
         MN8E8tZnWoKr8KrJhYanG37v2wGzH5XIWNuUzrWfWBIu9nDAYHUdjTYS9k0riQT+GlrN
         guDQ==
X-Gm-Message-State: AOJu0YxDehOsoheOXQoKLmJsmus/YEbtFwFwUZij3vnzkC+JDx9pfOmw
	LBUg553Hlv3CVjtg89glTmJlNT1rH2HBum/eB+87/DZ/rp2C7baU2pdQYg==
X-Gm-Gg: ASbGncv9RyIr+Q+zAltoZe8J03B1deu7Efbjkj6FXW/GOeyU6h2+nMrhhPGjp/0PeFj
	6gx/pjK5o/ZaIRNEDeQNOVzWCPBY1IobilIBVbfqXmXRgH6RhcdV4FQo2FDJR313Ppn2Mpe8Omw
	qJoPFyEdbd5X9ZBT8KkVkIVG0hgTA9A1BtKVEVTN0lfTXbv0NVOvj6lyfcOZrufWskSgj6bEd2I
	JNtH6Mi+ys+585SsQtVuifbnt1IxwV+J0J8DINSXdmfT1lUUI6Mzbgcmig4CDkFrGwsRlk=
X-Google-Smtp-Source: AGHT+IHgejJbZTvn3tDLrFuwcvP4fgnaxorGYa9mNJKKcgORE0YX5kTJXpk6VNoWrdy6A+9CFxu6EA==
X-Received: by 2002:a17:902:eccc:b0:20b:8a71:b5c1 with SMTP id d9443c01a7336-21c352c7d0fmr259867135ad.1.1737433249198;
        Mon, 20 Jan 2025 20:20:49 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:9fc4:f41e:933e:403a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceba48csm67763565ad.66.2025.01.20.20.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 20:20:48 -0800 (PST)
Date: Mon, 20 Jan 2025 20:20:46 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Pavel Rojtberg <rojtberg@gmail.com>
Cc: linux-input@vger.kernel.org, gregkh@linuxfoundation.org,
	Jack Greiner <jack@emoss.org>
Subject: Re: [PATCH v3 02/11] Input: xpad - add support for wooting two he
 (arm)
Message-ID: <Z48gnkze7PrwNJoW@google.com>
References: <20250107192830.414709-1-rojtberg@gmail.com>
 <20250107192830.414709-3-rojtberg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107192830.414709-3-rojtberg@gmail.com>

On Tue, Jan 07, 2025 at 08:28:21PM +0100, Pavel Rojtberg wrote:
> From: Jack Greiner <jack@emoss.org>
> 
> Signed-off-by: Jack Greiner <jack@emoss.org>
> Signed-off-by: Pavel Rojtberg <rojtberg@gmail.com>

Applied, thank you.

-- 
Dmitry

