Return-Path: <linux-input+bounces-9505-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14EDA1BB92
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 18:38:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59FF83AE290
	for <lists+linux-input@lfdr.de>; Fri, 24 Jan 2025 17:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61F419A288;
	Fri, 24 Jan 2025 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IPcCDBsn"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5F121A92F
	for <linux-input@vger.kernel.org>; Fri, 24 Jan 2025 17:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737740262; cv=none; b=I8OjfOUDu4M051NHO1D5qseKmuj6qCCGfAkaZeLt9CkKWYBamoNs9yUTrFYf/2BCYYdMacORdtb8jHA5vy4zYceQVCjTj50VuzPuxnT3EK6TjLWIqXTOgywXP3bjbj2m1h69ycrfPDC1VdKzvAKv+rcZfJ/9BdjaU9kGF59pj+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737740262; c=relaxed/simple;
	bh=mywM8EgZyZJxOPwyaK+Kh2gYIBo8BxriXmUPqll8hbk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=p9pZd2XIjJW0fYDOIBRw5CaaLP3E4j4PqcQs0YXHqrO7qz4EJ1INrb40is1IONc4GpkbkNV35s2QtxDzcOlbJvCT97Rm/fpfOlIQjcbZZD2BMlGKgBdPKjfkUxLLSSH4WrtuvDerh1BduysOmMTsVZURaCFhpQi3+97oB9bj2JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IPcCDBsn; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-860f0e91121so1827494241.0
        for <linux-input@vger.kernel.org>; Fri, 24 Jan 2025 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737740259; x=1738345059; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mywM8EgZyZJxOPwyaK+Kh2gYIBo8BxriXmUPqll8hbk=;
        b=IPcCDBsnYXCTOKkRipQZS23TtF1GLoAGO8iRiX2Nk8ucfSOfvN+BzfGM7p1BEkjhb+
         wOBjzByBwXTkyvLFDKEzfz0YkCDWcdCPoOgjTyym3LsyROX5pEcabhNbqwQgRBnHMJby
         Un5QYUYnastlmFG4o3twhOyUw0r+5BrozJFhEQOyncBGkOgGcv2sHjHZ3O8gZFq3mRQt
         mBNpDjiux3ctuTbWzx5ZHvfIiICKxmBDZ1Y7jf8p7cHgzcRhK7TvCNszYnDHnMCHPOPo
         RrqAZIGKmQV+nbQZwLI21v7mHxH9tQBwq1M4kFQZQbHeHNm6sd6rFVhnzUVl92q6kmd+
         umQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737740259; x=1738345059;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mywM8EgZyZJxOPwyaK+Kh2gYIBo8BxriXmUPqll8hbk=;
        b=jm5RCTHC40wCgZj5RxBPt+yNeoyRk8jUud8J+dBSM0cA9uwdXxOkIii/DJm/6OjWlw
         RDfi28XXsbAgDi1fWszEiFoeqolTUk7cphpzWJi3pPlIhEmEZRh9NuEsJNK8+C934MV2
         pttZ4eWNOnV9rRGXlwUvIe5avIef3Jo/JWZIgGlmkLlXS+mwt7CkPwTiDUfQ/b+4Bx+M
         g/IsJBJjZdyfLE3PFntQ6lUOIlJe0P5HxMwFcRwbj1Ir+2l6zdlHttMmj1ki+Gi/kE2e
         yv2Oihy+bCQIqaI+F7t36WiZUHTKS8QIek3SSH7j6V/I+TCijemE4TeALe2mx9tC3eqy
         Zrsw==
X-Forwarded-Encrypted: i=1; AJvYcCXTxXvO2n89yfW3epAWA7RA6RFWVPDx56RZlzdQISuLTXoX2aKewmDyrzVCeRBktKL8AxZkFWam2PsCYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2dENPZx2NfiymyUaKxe4RhOW/t7rfuyZic+55D/JmwRaJcrc3
	jbwsHJlW5LlN7lBEhMCp02kT7Wm/ZgbjDtgWcWt4c53DNR/tM/yWLSHYfuDab1yH7P8LMkrf02n
	1nm5RhR6zzYKMW2qJtNllXseTClw=
X-Gm-Gg: ASbGncvVy1RMd7TpTzZpi3a1R6D0YONLTZLkkq1PTqHhYThsSU8dx8KF+/0X4DQM0q1
	U7Yh64nYx4R3v/3NxSrDbCy8IbFgr7zHyPbQMi0h97+3sydTCvZY+PDji3gpRAKqQ9sBd3Xgj
X-Google-Smtp-Source: AGHT+IGPMVqdWtRq40gq/A67L1VH+542aXrtnbh+VSvwBG1bnP4FOsZWYg5riOJaFoabPVN9H9adtt3jkuEgJiGfdQ8=
X-Received: by 2002:a05:6122:4001:b0:50d:4b8d:6750 with SMTP id
 71dfb90a1353d-51e3ddbf001mr8167418e0c.1.1737740258993; Fri, 24 Jan 2025
 09:37:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?44Oe44Ku44Kv44Ki44Or44K744OL?= <aruseni.magiku@gmail.com>
Date: Fri, 24 Jan 2025 19:37:34 +0200
X-Gm-Features: AWEUYZm1DVA8Gip8OHOZ9JmVsvUw1cpmL-i1UfOvylFhD1az8NocFMlnvMOeDcY
Message-ID: <CAOd-nGkryas2r97C493qH8w12+Z3=AMRXnTAQy1wLsgDwWf=Jg@mail.gmail.com>
Subject: hid_logitech_hidpp is causing a long delay before MX Master 3S
 becomes usable
To: =?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

I have discovered a problem with using MX Master 3S with hid_logitech_hidpp.

After boot, everything works fine.

Then, if you left the mouse unused for a while, it disconnects, and
then reconnects automatically once you start moving it.

The problem is that if this was repeated a lot of times, for some
reason, it starts to be unusable for about 10 seconds after it has
been reconnecting.

If you run bluetoothctl, you see the Connected: yes message, and then
the ServicesResolved: yes.

The Connected: yes message appears almost immediately, and the
ServicesResolved: yes appears after a very short time.

But then the mouse is still unusable for several seconds, i. e. cursor
does not move.

Then it becomes usable and everything works perfectly until you need
to reconnect it again. When you reconnect it again, you need to wait
again.

If you restart the bluetooth service, everything works the right way
again, and the mouse is usable immediately after it connects.

And another solution is blacklisting hid_logitech_hidpp. In this case
the mouse reconnects instantly.

Please let me know if any additional details are needed.

Have a great day!

Thanks,
Arseny

