Return-Path: <linux-input+bounces-12095-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0E6AA5C60
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 10:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B4DE1BA3D70
	for <lists+linux-input@lfdr.de>; Thu,  1 May 2025 08:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE390B67F;
	Thu,  1 May 2025 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXUGT2WP"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E541E5B6F
	for <linux-input@vger.kernel.org>; Thu,  1 May 2025 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746089586; cv=none; b=qxIlLx3mbUtedyp1Tkmw9XMnOWnR5MXsrZGvO6whE4q8i61wRR8b/zbbq+yw3hab86vTrkVIuSBoSYFGkkHYTZClNfH4ctq3Rq79vFA+NQ2BcazK/9zh19AJcHQDxtKoALCTevzLb37aHGZwPIMbOgCw49cnN5MNUeaaKgOGlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746089586; c=relaxed/simple;
	bh=YJGP7idlY3B7KHg+00mZ8pXBa0NGC/4uGxaGIz+Z818=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uc0gp2iJN9FsIkm6GZb7w44kXq5U0j/psLAAvJxfQEXXXy6d4dNH0359+0lpOn+ZjeHiq0n3/bdylIfXlwM0nLJr2501EN1+N2DwHyXN8dGErq3Vr+BJwt+Wzo+u5sLZghHiQ/5PsJfBQoxN4DGa7OzhfmxJ1y/wsPawE/FPvis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXUGT2WP; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c1ef4acf2so460650f8f.0
        for <linux-input@vger.kernel.org>; Thu, 01 May 2025 01:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746089583; x=1746694383; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YJGP7idlY3B7KHg+00mZ8pXBa0NGC/4uGxaGIz+Z818=;
        b=NXUGT2WPlr2FW8/JDe7KjAEL1PwiL+dNy+mSf7BtdV+Ulwki89+l9veN/ox7f/szl1
         LUTqC9SM2uRCRMUp+vHEQpIuF4EE5JYBn5GRLzltqhqKJU9h+acwxwb8UyQ5cUKd8fvP
         isO6CnBy5vfhSPwOhvI7zg7J7fWLk0Q27i1fWji0Q5gjpav7vw9cH1sODeJtTvooKGNc
         bzJkBWIXpx3r8AZeGDWg0J7G6Bn6CZqKd+fMbZYxXMO9R3D4rvoVaqD3uHZCFy/fbHUR
         q4S8a0e6+gFWsIwfCSJahv8dqJs5aK9rw4JtHYBDq9u313bKKx7xjodoGd/gNGvt0f7b
         t3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746089583; x=1746694383;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YJGP7idlY3B7KHg+00mZ8pXBa0NGC/4uGxaGIz+Z818=;
        b=iCpjsy6+qAg3IOLSeXs4p5kcK8I+you0lka0N63dCjV0y3FtNImq6LiAhVzSE8CESk
         2yqNU5dTbNY5uvyJTSJykt22P2Piu4Iu6PNoF1yrre5U6YxrBqGQlO5/KFBtiABYll8n
         Nsr8jTxZaOJ5OpJwBamwryvVYUjbfV8wmzJCDVpyEn+MmHH8eIWkn6oZeHJ4yx4JZITI
         xrhrAz20I0Ixs3JjWh9phLyqukIAkJjjhSRqSxxNzxttU6pzJlwfJnEfShwlYFAHhZ0O
         DIIS7HSTvJ+Sx7IctkR7vk/n0FkyZmSAY1X+zCry8YVVODOkFhHxfJmNwVCAiHKWjjw9
         H2EA==
X-Forwarded-Encrypted: i=1; AJvYcCWrME0GiI/CafgP+ZQZKbdWkZNT5Emb1OnKwKNDSKpUQfiQsBAUv0GUlpRwjrq/TCuurCRc24o4bylEXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYKoWGM+kEaQbYPpZYoWxgm+qDYRJaLSD2QbtZuZzzbsdnwxNC
	Isypf/aDW0R7obwYmDFj8MCjqVH1jPpUDH9qdZt2UI12XooidWPoLgUrZeMvuNJ1UBBgwoheLbd
	57w2vjBwd5JRDlxK+Cw1pE2rvAqyXD+q0B5g=
X-Gm-Gg: ASbGncuV5TvZfzJxhReJrU4ijY3XxwOaTAzfZ/nmG/KVdCBEMdDPQDEodrtk1dFLp8Q
	S82DOc7TyiJj9Vk88jN3UCVY6assUEESL0qmx7ls7AboXxPh3Sp17bEl/FA4AGAnV0A+01RbrfX
	WgTQuFfdFE/3kjugNs7/aCyMY=
X-Google-Smtp-Source: AGHT+IF4kyCNCasL6WIyRoeDqAlQzSiF0AbFw5uCYCDOQIb3sTKNk0FtBGziobPoI9/MHp9laFeCnf6HK+nVLdxyouQ=
X-Received: by 2002:a5d:588b:0:b0:39c:1257:dbaa with SMTP id
 ffacd0b85a97d-3a09417d7cfmr1211012f8f.58.1746089583287; Thu, 01 May 2025
 01:53:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAbCkm+hdmJ4ozW4viBkwp+7QQPgymA+bfb5ddOUCB=kaBvF9w@mail.gmail.com>
 <PN3PR01MB9597EA06B5B28C50A8CBBD3BB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAAbCkm+v4EV2TgkfMSGjYNvy_HgXSYAm2cFYjjrA4tv+WqBREQ@mail.gmail.com>
 <sxipdsuhfffda56hwlvajai3pfxamcefbvyu6mcwr4nmgsri6a@hfblyrc3hxau>
 <CAAbCkmJVWu9x4=68aKM+LNrU1BZ1bJm5TVoye3qGryw3yfF43A@mail.gmail.com>
 <g7xqjium63zvujt55nng3imurlan5smkv56ad7em4kfnzmmseg@a3lcjlmzcowh>
 <CAAbCkmLbj_w_UzTt8mMYnfA1P02x0cK46jWZyhiRzpRNHEBRwg@mail.gmail.com>
 <CAAbCkm+cnYCoe0+40rvHT8yt06N06fjq6P_mZOZvO0kXn6v=rQ@mail.gmail.com> <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
In-Reply-To: <7dzdsnr555tdnmwwp4n2bbycq7dbk6l32r7cz7i4arnln5qy3m@rmzvahhxk4dv>
From: jt <enopatch@gmail.com>
Date: Thu, 1 May 2025 09:52:51 +0100
X-Gm-Features: ATxdqUEZNY4L0FdBHLUhCv7V_FvorqES-lJYheozgpQM3Vk0w3uH0C0XTOUpMoo
Message-ID: <CAAbCkm+0PwSB+1OFQ1fOZQf=eMbrefxgtjzfpcS0hq0_HveZBw@mail.gmail.com>
Subject: Re: PROBLEM: Synaptics TouchStyk (trackpoint) on HP EliteBook 850 G1
 detected as "PS/2 Generic Mouse".
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Aditya Garg <gargaditya08@live.com>, linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 02:19, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> Would you like to be
> credited as "reported by"? If so what should I use as name/email?

If I have not already missed this opportunity, then yes please. As per
this email, "jt" and "enopatch@gmail.com". Thank you for kindly
considering me.

