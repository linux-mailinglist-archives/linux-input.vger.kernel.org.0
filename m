Return-Path: <linux-input+bounces-872-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17002819447
	for <lists+linux-input@lfdr.de>; Wed, 20 Dec 2023 00:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15E971C23DD8
	for <lists+linux-input@lfdr.de>; Tue, 19 Dec 2023 23:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AB83B190;
	Tue, 19 Dec 2023 23:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="e8wWZKA3"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF1403D0AE
	for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 23:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50c0f13ea11so6219532e87.3
        for <linux-input@vger.kernel.org>; Tue, 19 Dec 2023 15:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703027025; x=1703631825; darn=vger.kernel.org;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqTdt56TrQAvwvOhyDEFpAKiAooVjdqOxCiCnFgMXM8=;
        b=e8wWZKA34mNLep4AFkY/hFlwtBrX1+52DbLHTM4zQeoqBcX7HLSth9bYlCJ+PyERHc
         59aIE5UuvSs+pwZhTp+2LGsdwrXbJsyCVI64cV0ZWDjgiba+5Elw5lzM6DGarRC21Av1
         7NvPTlKUmgX/4vS+oWh0bzNIOTgkD12zhb77waYh1bnoBq7j7B2xs+Bp90VW+kgO0R4i
         xNgS+1pDPtZyUuRt/JYAXE1P+K5ny7DtphBzJXrQEWQnmGz7IxttR62TBZ9DqCe1yLPW
         gnI3fU0f7iqo16Cq/7GOPQbf6AlKEMnvzzJLsDJ5S12Dj4sZFTQA/9andfOXFY6UF382
         iwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703027025; x=1703631825;
        h=mime-version:user-agent:references:message-id:in-reply-to:subject
         :cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KqTdt56TrQAvwvOhyDEFpAKiAooVjdqOxCiCnFgMXM8=;
        b=Pr/xWl9er9w/hkMEh8grHpbEEHCgliIHqP9Ek/bntdaqDPI8i+KFsyuwO8dT4PNpZv
         otWYWoIjmGxJb8kO6tUFauuJC6T7zl8cI6FEZ5t4gWJY/lBpsyBF9fdvQ3Bb1khD6gzD
         h2S1Bnweva8CblKnuDogGUrCCYiRD1Euan89fOU70eVQ5Mvfcn6fjoLNBwMIb0X+G8QK
         lJs+0Oy6pytTvXUk7vhDruo6Omxe/NHX6hux91S90P/lzC+exjRVg8/Cm5JRT6aLgXxw
         f3FCuUYhWdtLCalKmrZRvo5BCl4yTcV2VCufmE2pHXq8tgykgBfGml1sqpUaL6vlSL9f
         vUJA==
X-Gm-Message-State: AOJu0Yy7xXmGK8Mo7N5MzO/Nzb+CTuSNSpJCA1PqfoZiovwJvwmH+z/C
	1Y6BnBRdMHXSkuz2sG0U6+vqjQ==
X-Google-Smtp-Source: AGHT+IFeBWpJYs09SdBy3CD0jvYvP6KBJwOfUgp/+rhoNZ/0Oj/QgYgVjrK7dPDSO/gC9KhsWtBHNg==
X-Received: by 2002:a05:6512:158c:b0:50e:3e7c:c039 with SMTP id bp12-20020a056512158c00b0050e3e7cc039mr2077091lfb.115.1703027024897;
        Tue, 19 Dec 2023 15:03:44 -0800 (PST)
Received: from localhost (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id mj16-20020a170906af9000b00a2368de9471sm2045964ejb.202.2023.12.19.15.03.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Dec 2023 15:03:44 -0800 (PST)
From: Jiri Kosina <jkosina@suse.com>
X-Google-Original-From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 20 Dec 2023 00:03:45 +0100 (CET)
To: "Gerecke, Jason" <killertofu@gmail.com>
cc: linux-input@vger.kernel.org, 
    Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Aaron Skomra <aaron.skomra@wacom.com>, 
    Jason Gerecke <jason.gerecke@wacom.com>, 
    Joshua Dickens <joshua.dickens@wacom.com>, 
    Ping Cheng <ping.cheng@wacom.com>, 
    Tatsunosuke Tobita <tatsunosuke.tobita@wacom.com>, 
    Aaron Armstrong Skomra <skomra@gmail.com>, 
    Joshua Dickens <joshua@joshua-dickens.com>, 
    Ping Cheng <pinglinux@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] HID: wacom: Correct behavior when processing some
 confidence == false touches
In-Reply-To: <20231219213344.38434-1-jason.gerecke@wacom.com>
Message-ID: <nycvar.YFH.7.76.2312200003260.24250@cbobk.fhfr.pm>
References: <20231219213344.38434-1-jason.gerecke@wacom.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Jason,

both patches applied to hid.git#for-6.8/wacom.

Thanks,

-- 
Jiri Kosina
SUSE Labs


