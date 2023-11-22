Return-Path: <linux-input+bounces-205-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C507F4E36
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 18:21:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63A7E1C208C3
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 17:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0361357891;
	Wed, 22 Nov 2023 17:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ir4zVGFs"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0AEB083
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 09:21:49 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6cb9dd2ab56so37022b3a.3
        for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 09:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700673708; x=1701278508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=znCgUVjyPUsuiOV6uODJ0dusaR6D3T5wY/y+LHOiytY=;
        b=Ir4zVGFshlJUztM+kh7YS6oWWdmTZh4ijjltc6Vuy0qmW/3fivjm0JgNvus0RMkBag
         WJd8uRCwAiqLKk14p9tkwAYqpog4lv00F0gHXK8s3fqxIiIhFGxNY7dV3MmP1grvbUS6
         yV/nJFodX/WXpjLlOTZ2peluviDoSjBIiIUEPIzGEj2y9270cX7gix1LDug3k1KkB8kY
         B1/ov9LETWXFEpIhC21b1GT4OMiKT/2uLeiVttXMUnutWt/mact6A8mtsfUPDaunWAgU
         iFkOXPCrBLFLlQumhTzUmAhOUrkPRflIxpO/rNf5tIJM7uXE9wSS5MLo19U4dU1q78qL
         yG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700673708; x=1701278508;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znCgUVjyPUsuiOV6uODJ0dusaR6D3T5wY/y+LHOiytY=;
        b=SA7eYBNF0xXmBfgIcxUz/P0xDN34jbmG+XGNsQ2EQe4nnLlEOLSMTdD1wnMWY5dXVO
         plSAKry2odc8XyUZ3dtTenr4LrLQFzmwTsK8GFTlMnxazSWXkXwnGwXFbcDDsfMVh7Zd
         4eCKbiWjSN0bOHJLEHn729zuzU22AN9ese0chNBQdDmTJlkNDmt1oQTARj++pAaTPPTm
         HGrcR4tWmgd31Y7Lrj3OtDd4mrOSixVh8dINkNS8UapOlR3o1o7TlSzRnxIAPyxT8duM
         fL17RTWtHwsrYdIF8uXkDgCWfF6WUMMpkvQ6kxvi+gZb424CGwv1kZJIUB/sX0VklX6M
         rtiA==
X-Gm-Message-State: AOJu0YwkcAGr8QR4OTWkG2avDyrj56jJIlpzlb/HqQejorRppcslCaTj
	DQ7dJNcpbfLB7vrEYRqF+DJzcfOzhAIrxQ/69tZbB56vp8I=
X-Google-Smtp-Source: AGHT+IGPFp7bs2tGjs/OOMluLPBiHJM34LXRBHAsHI0FBCnQn33onN2hN1HS/SMZouDz5rhALdRaQq/2+0EyNTaAQOw=
X-Received: by 2002:a05:6a00:1147:b0:6cb:cc67:90c2 with SMTP id
 b7-20020a056a00114700b006cbcc6790c2mr2732471pfm.17.1700673708084; Wed, 22 Nov
 2023 09:21:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Andre Eisenbach <int2str@gmail.com>
Date: Wed, 22 Nov 2023 12:21:34 -0500
Message-ID: <CAOEevLOrTSugnLePJwpcqx2_AacNbBxFZDTqp0Qm_jjVpWKgFQ@mail.gmail.com>
Subject: Logitech G915 TKL broken; SHA identified; Please revert
To: linux-input@vger.kernel.org
Cc: Mavroudis Chatzilazaridis <mavchatz@protonmail.com>, Jiri Kosina <jikos@kernel.org>, 
	=?UTF-8?Q?Filipe_La=C3=ADns?= <lains@riseup.net>
Content-Type: text/plain; charset="UTF-8"

HID developers,

Ever since this commit:
9d1bd9346241 HID: logitech-dj: Add support for a new lightspeed
receiver iteration

My Logitech G915 TKL keyboard does not work anymore. There is an error
message in the kernel log:
logitech-hidpp-device 0003:046D:408E.0004:
hidpp_root_get_protocol_version: received protocol error 0x08

And the key mapping is broken (ex. pressing the 'F' key results in a '3').

The receiver I'm using has the USB PID 0xc547 which was added to a
list of devices using the logitech-dh driver with that commit. So I
believe it's using the logitech-dj driver instead of a generic hid
driver  from that point on. However, that causes my issues...

I would humbly ask this commit to be reverted or the PID above be
removed from the list while this issue can be investigated and
resolved.

Please let me know if I can provide any more information or help
resolve this issue somehow.

Thanks,
     Andre

