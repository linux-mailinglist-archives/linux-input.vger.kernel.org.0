Return-Path: <linux-input+bounces-14535-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7477B47BF0
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 17:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BDF317CF6A
	for <lists+linux-input@lfdr.de>; Sun,  7 Sep 2025 15:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C889F23D7D3;
	Sun,  7 Sep 2025 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SJHaDOGR"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AB1F5434;
	Sun,  7 Sep 2025 15:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757257829; cv=none; b=bEPQZacG/Av/dy0ihmYgfjJX7WaQKU63Szqmk9waZeH9C3y6QZJDiK3cx1BFYnJ/5C94HThMLOEdNX5qKlko8WaD249XKOdRNUYnDfEH2ZWRpXSWDzopxojeFZLOtjGRmYhkK4RDhLyuxpEAjR6xqsI57Ym+LcirBMFPW7+yjqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757257829; c=relaxed/simple;
	bh=sAHtV31vC7+DbBtKfZ3bGC6susimxTF4qxvoih3PDug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mQq0dftvmFd3HxGkDRfRxGte53eW0UBiP2fkU4PJj2IU8/gpnXTMSPtFWVKaGsbUHeWbnmUd3K+xkBQOgJUKhtmwKtuGrr8YHBeFfoT/k5mwBZwua5EtNZ5c71OSS2u2ZC9TwfPF6pCazzOLepxv8xZOGJOlCr5bOAUZlKhc6Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SJHaDOGR; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afeec747e60so677402266b.0;
        Sun, 07 Sep 2025 08:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757257826; x=1757862626; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=oJuiBORU7uFgAwcceqMl7pia4M58UQmYtjkhakEe8GY=;
        b=SJHaDOGRxV2GOg6O8gfQepiaJjywxYWPkdoZU0qsHGeRWGWKpO9vDsGPK+UKly9CWI
         ZaHi7sBQJG6CF15djAHXfeOg/PQr6rguPD3YKuAZpJPI81LZJv0ODqh8/DiE6pxz3sTo
         dwHE9yNPnmvxoMfEonL2sAHMmWIzU6VBThObQcVW3wOl7njgSYaX1eXt7D6zjta2nm5d
         eOyBXXN7Rr9UNKaHT7EKFEyyePV2Be6rbeD6CZ3/m7GXupsN7sDaKmDJcYgN8nhsoaoE
         Z+f6tjGqwDtUqgJ1/d147cXxEpDDmPAOJGgSGnl604rtRM7o1z3AvQL2fhQ7aMhyQjqR
         7BSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757257826; x=1757862626;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJuiBORU7uFgAwcceqMl7pia4M58UQmYtjkhakEe8GY=;
        b=kz5WdV30z2LLbXWSLdgfg+AaBcJiAwyDP0EsNWoz0xBLAQkOTN2qYKQtXcyGH5NTbs
         ObAz84/8Yur+llOCBXF/25D7WJXgF8CC9Z/3SnoQFpxLHsGNDPCMDbAsrDh9KpktWY2k
         8ZtwikgGoOaiVPYWwwjBaXmj3g914ItymV2/oa7P+jErEXAySGskIEm79cysIZKxJZzT
         qejbIyBXKX69IJzPKui/L+jA8A9kx30gr7Vl05yOzrav4T57ntGNrN5LwhZzqWaZEo+z
         11dQnDzhFVlt9E8mbJjM8azpOAMZaFpVRijd7iYaj8Q3T9+s+IfdUnoW/KLP5iX7UjMA
         MkZw==
X-Forwarded-Encrypted: i=1; AJvYcCVj3yG6Nsp1bWMaMz4Vfn5q+tgRt84E/D9Vfn/eZrOklnUE1Ss09bd7UO74mPUW9BiNyjcdSBON@vger.kernel.org, AJvYcCXEaXYtTbrF94/KU+Vqx+b9F9FQBKixscJ3dkYn6uN5TkiNNuVTUkPcQ4b6M8dZiKPHJYzmjGDWJ5Dd01fu@vger.kernel.org, AJvYcCXLJNI52WvSsoqJBJTuoZryubfCzLoWj86zxoqc2scNDa8qzsnP6Zw4r6y2q1Drc77oNPdGnAYC3+Lm4g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv4sJctqAOMrxVgr0Tlw527FN3PDHxuvqzvwbKvCVuNPOydNwj
	V3UT2wPanZ6IuGGKyZHisbgUeSh5Rx4RGIgoAqihr7cecVUsCa0lWGPj
X-Gm-Gg: ASbGncsjmim7nEoJmhCt2EstQMvM4u8hxoZdXK2MHMYi7mjfwmIttQz653Ok22GBTdO
	+utvFaYSCuxa7B+tBFi1CT5f0HXSSjQttsz1I6Nwtb08DKnu+o+Y/jOyTLa1XBkt2DkFVb0bFIo
	naxHOQ25gg/hPgzpyqi8Qycragj5jAspt7GtNKUex3aZtPNQMauy6ZwE3075/va5/o86xsuK562
	ojRnaeXJH7Xk1aRwAMSUMXjdPTa2j/zaz3aeW3qOOH4FRY+mJ5T5JTEB1UaYcdDsX7mpGeLb8mw
	qa0JPRtSXGtgs3r7sHWGAPcTrMBNADSbt6eU2veGMhDhqJNtMtOumvO4FUp1Z71zDFB5iDMrZaS
	HdlCxCdqj1SpFi0QZYAAuP6ahUhxsG3+1VBJqHMvslRtjiWOttnFKYfp9oFaFXGJmAg==
X-Google-Smtp-Source: AGHT+IEd/pDyjRmSKqgdbInAZgvxP22+j7RYNze25r80HBPkSMsOwswGrmhAArMFjtCaphKv56oPEA==
X-Received: by 2002:a17:906:99c5:b0:b04:858e:c1ee with SMTP id a640c23a62f3a-b04b13c13b7mr513268266b.2.1757257826138;
        Sun, 07 Sep 2025 08:10:26 -0700 (PDT)
Received: from eldamar.lan (c-82-192-244-13.customer.ggaweb.ch. [82.192.244.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b041800e89esm1837245366b.30.2025.09.07.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 08:10:25 -0700 (PDT)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 4DBCCBE2EE7; Sun, 07 Sep 2025 17:10:24 +0200 (CEST)
Date: Sun, 7 Sep 2025 17:10:24 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Zhang Heng <zhangheng@kylinos.cn>, Jiri Kosina <jkosina@suse.com>,
	Staffan Melin <staffan.melin@oscillator.se>
Cc: Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org, 1114557@bugs.debian.org
Subject: [regression] 1a8953f4f774 ("HID: Add IGNORE quirk for
 SMARTLINKTECHNOLOGY") causes issue with ID 4c4a:4155 Jieli Technology USB
 Composite Device
Message-ID: <aL2gYJaXoB6p_oyM@eldamar.lan>
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zhang, hi Jiri,

In Debian Staffan Melin reported that after an update containing the
commit 1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY"),
the input device with same idVendor and idProduct, the Jieli
Technology USB Composite Device, does not get recognized anymore.

The full Debian report is at: https://bugs.debian.org/1114557

The issue is not specific to the 6.12.y series and confirmed in 6.16.3
as well.

Staffan Melin did bisect the kernels between 6.12.38 (which was still
working) and 6.1.41 (which was not), confirming by bisection that the
offending commit is 

1a8953f4f774 ("HID: Add IGNORE quirk for SMARTLINKTECHNOLOGY")

#regzbot introduced: 1a8953f4f774
#regzbot monitor: https://bugs.debian.org/1114557

So it looks that the quirk applied is unfortunately affecting
negatively as well Staffan Melin case.

Can you have a look?

Regards,
Salvatore

