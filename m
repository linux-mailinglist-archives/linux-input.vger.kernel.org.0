Return-Path: <linux-input+bounces-5451-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4ED94C3AE
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 19:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55BE81F23710
	for <lists+linux-input@lfdr.de>; Thu,  8 Aug 2024 17:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 619CE190692;
	Thu,  8 Aug 2024 17:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkqg4BRN"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B7E1F19A;
	Thu,  8 Aug 2024 17:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723138066; cv=none; b=j8TrubxOVo37NaTj2xTA/1cf3jeYp1Z1A1sl7jMGH5jc9ptTMWDG7Qt9NFab4AnMTZGrH8SnL2IlzEjL8xU7GAAyG7NFTaD59UVVGqP6F738xXKp3pV7UdOjcYwFUurYPJubNeCAzGQ2u9NtuRD7c9PHvWmQcouJ3W/uRKU1MpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723138066; c=relaxed/simple;
	bh=lwUQfOEc2hZe4/KMXO3cqzXDSPRfUQogVwfP9KDe0zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WomCX7Mis1D9oY3n74dqiKSCnW7k+LNVp1eDtZ0wVXE6tvBcRJeMfQ3zcs9ttT/HDsXnGxZb0+AJnDyK2Yq3s5fdRqnY0y27SO8aUvPcVB/QdlUZQpFQAVhkCCTTN06a68LNL99zea/mX6C1PZKDvPKAs0qU++FVovXY7Uf282g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkqg4BRN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d199fb3dfso1001449b3a.3;
        Thu, 08 Aug 2024 10:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723138064; x=1723742864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TnC2UNJgJBzMoYJ2xUWxB+uaxQleBrW7qhwl0df1128=;
        b=bkqg4BRNSVIm3O2GwzWo97NOkya7cvvh/mPwvYR2nXO4f4O9j0eQ+lVxNIRtkAPzSW
         EsYXmMjiB+qJuMsbGNRT6bzw3LT9ZSJxsBHJAg9+LbeCvYWLwDmXlve7FahD8d0kdiqT
         lG7Il7fPz4KKfn+t1a5LXRL1KBrGfSjizGvAOqAVsg9aliy8vr+QYydY/T7uipei46UC
         XMlE7KOUYRknpKRK7/Ule63vZIEpKDdlynodrskAFaNIlvijvf2mDbBTkH7VEKLTbziw
         mmvkaLawb74VSucGescgKoMuX89QiGtyj0tM7gIQCBtTY0lMVvdAR4g33yp8E4+gV+L/
         gBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723138064; x=1723742864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TnC2UNJgJBzMoYJ2xUWxB+uaxQleBrW7qhwl0df1128=;
        b=I3jjmjKsGPw95rqgMP9ZaiBqY584YUTOIH7QdkYk9JOkKTKwPFedQMvQZIHtlsVSPJ
         pF0cbbzc2aYam1l+mtTEGaNOsCcs3QssBkdUsSHtbo+bUnAlKbt+BoCPeWlIee0HMgKX
         LFBay9S3yGqCKZBp+teRSYh1bRtJI0jsQbvsw33farttdfU1HFqf2D9946I6z/5qyiLx
         SWuGl7Mi2RwGKkE3wJoxzcLq+VX6kC5GYdEDHEpI7h8z9E9xZLs6sZdrgqZOOkYYiXuC
         YfA+ppZl4ylvOYFXssUKW1KAeqqBMfA77CVtmSpsN0tVEEXxmFGsZNkFwjkb/3HDbeBA
         Yqlw==
X-Gm-Message-State: AOJu0YxyKWtkTCa+JYJlSVuPXafWDpuY5wkKPq0Xqy7wBk0s0rFuRD3r
	tSBLl972akSikICqbe/RQNr1dcNGElo3cEqMv3oUxvrkrmlmT7TuYaZP3Q==
X-Google-Smtp-Source: AGHT+IHXqgA5pTOf/q15EL4W+gWcslWxIUxssa6YVtm5dlZbtVhUoF9fadEbjkut3Nf38JHHyjxwpA==
X-Received: by 2002:a05:6a00:390c:b0:710:4d08:e094 with SMTP id d2e1a72fcca58-710cad31263mr3448382b3a.2.1723138063852;
        Thu, 08 Aug 2024 10:27:43 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:4403:e9e1:aefe:e6e8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710cb2e89ffsm1349829b3a.180.2024.08.08.10.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 10:27:43 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vojtech Pavlik <vojtech@ucw.cz>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: [RFC PATCH 0/5] Removal of a few obsolete input drivers
Date: Thu,  8 Aug 2024 10:27:26 -0700
Message-ID: <20240808172733.1194442-1-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.76.ge559c4bf1a-goog
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

I am wondering if it is not the time to retire bus mice drivers since
they have been out of favor for close to 30 years, as well as 3 drivers
for portables from late '90s to early 2000.

Please let me know what you think.

Thanks,
Dmitry

Dmitry Torokhov (5):
  Input: inport - remove driver
  Input: logibm - remove driver
  Input: pc110pad - remove driver
  Input: mk712 - remove driver
  Input: ct82c710 - remove driver

 drivers/input/mouse/Kconfig        |  36 -----
 drivers/input/mouse/Makefile       |   3 -
 drivers/input/mouse/inport.c       | 177 ---------------------
 drivers/input/mouse/logibm.c       | 166 --------------------
 drivers/input/mouse/pc110pad.c     | 160 -------------------
 drivers/input/serio/Kconfig        |  13 --
 drivers/input/serio/Makefile       |   1 -
 drivers/input/serio/ct82c710.c     | 239 -----------------------------
 drivers/input/touchscreen/Kconfig  |  12 --
 drivers/input/touchscreen/Makefile |   1 -
 drivers/input/touchscreen/mk712.c  | 215 --------------------------
 11 files changed, 1023 deletions(-)
 delete mode 100644 drivers/input/mouse/inport.c
 delete mode 100644 drivers/input/mouse/logibm.c
 delete mode 100644 drivers/input/mouse/pc110pad.c
 delete mode 100644 drivers/input/serio/ct82c710.c
 delete mode 100644 drivers/input/touchscreen/mk712.c

-- 
2.46.0.76.ge559c4bf1a-goog


