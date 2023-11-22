Return-Path: <linux-input+bounces-208-lists+linux-input=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 613D07F51D9
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 21:46:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9153C1C20AA2
	for <lists+linux-input@lfdr.de>; Wed, 22 Nov 2023 20:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCDC619466;
	Wed, 22 Nov 2023 20:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ck1JC07K"
X-Original-To: linux-input@vger.kernel.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E430111F
	for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 12:46:45 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50a6ff9881fso202820e87.1
        for <linux-input@vger.kernel.org>; Wed, 22 Nov 2023 12:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700686004; x=1701290804; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+ZdssTe8RvOnkacLDsSnzdhInCqeFGdSeJ8S5r6PhQs=;
        b=Ck1JC07K3hp72YMwXNBDl9AA5kLKoJ814zhNLD+YBzKs59/3Kw7pJ1uS75g4xblaVw
         sLfgPBHXro69MAGYQ7S1o/tCRZ4fWxYMoOTzWnlSyXZ0e0d8Zutj1t96uSbOLY0f503g
         0QhYav4qX3WpecWScYILTMjH8nrv0lodkdoLw6/SFJnaL0w/m8twqpV39XfeH+jxDA6d
         GL1vZ+cxx5ysiQkM4FYMSnlPa/exCi9QFID4v5MUwbqPOiJD3GKZ0/d9Wl0AnUgoL01j
         IIGk+FC6I0eW2OlaslKlIWgHEZDar7gY0F+oeE99lC+EBngvsr+WUZnUq+EKYvIdTrNE
         7m0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700686004; x=1701290804;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ZdssTe8RvOnkacLDsSnzdhInCqeFGdSeJ8S5r6PhQs=;
        b=lAJP4kAyKWiGxRC3OTnEbpmHtQOuZt3Nqe0z9hP8H5qYjNRHU7/G/MZzotXVS0c6VG
         55w2ng2z5tS0gdJaV4qNUaT4pSjom0Nc8TJ3sCn+eh4iVfPtOfqomcASZstVFW4m86Mj
         ajFTv5jfu15dcY3PgTIoFAyeezs7DYPB9JgJ3QpYohR6dCGE+V0y6CjHB2eQIHOIu3sD
         fp53HJRsf0RJ0UKxLX8BF1ALmlVxSAGbcPgg/WzRpDcfVGcuNlMKCnZsa/YBv6MWeJtb
         wRlPZlrMoh18KRW9EDIbNEd0vlBsehF5lcrmys+13bfa01k0b1euF0YkG9H/y76H/ePc
         WLeg==
X-Gm-Message-State: AOJu0YzJwDZetjnbt2efXN5f7x5eqxkCxGx46Z4ae/E1KeF8xhnKy+Jd
	G5XTgl/dHJFBR0YdtZ5IVgIycc09tIAgpoPVqpxNnoDaOqU=
X-Google-Smtp-Source: AGHT+IGRLzrD23JAXNeCAnExsikJOXKg/GNQJTo8aNwJWhnyUPz3oGSxUnKF1feJtMbeHYog6/FeWpucU0DFrh+m4jM=
X-Received: by 2002:ac2:5982:0:b0:50a:2711:304d with SMTP id
 w2-20020ac25982000000b0050a2711304dmr1003510lfn.6.1700686003560; Wed, 22 Nov
 2023 12:46:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-input@vger.kernel.org
List-Id: <linux-input.vger.kernel.org>
List-Subscribe: <mailto:linux-input+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-input+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kamil Duljas <kamil.duljas@gmail.com>
Date: Wed, 22 Nov 2023 21:46:32 +0100
Message-ID: <CAFR=A7mFbMH9xt=FnzQzeZUtYv0AAMK=9DfPaBNcttpFj1z7Jg@mail.gmail.com>
Subject: RMI4: The RMI4 specification not found
To: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	Andrew Duggan <aduggan@synaptics.com>, Christopher Heiny <cheiny@synaptics.com>
Content-Type: text/plain; charset="UTF-8"

Hi,
I would like to become familiar with RMI4 driver in the recent linux
kernel but I couldn't find a reference manual to RMI4 specification.
On the net I found an old version without the f12 feature.
Follow path: drivers/input/rmi4/rmi_driver.c contains link
http://www.synaptics.com/sites/default/files/511-000136-01-Rev-E-RMI4-Interfacing-Guide.pdf
returns 404

-- 
Pozdrawiam,
Kamil Duljas

