Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D2233AF765
	for <lists+linux-input@lfdr.de>; Mon, 21 Jun 2021 23:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231234AbhFUVcx (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 21 Jun 2021 17:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231218AbhFUVcx (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 21 Jun 2021 17:32:53 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0216C061574;
        Mon, 21 Jun 2021 14:30:38 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id h11so3746220wrx.5;
        Mon, 21 Jun 2021 14:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JurTSdOp+UFrSX4hMp+B1Orm1qcT5exeX9APSpHRGFc=;
        b=dqRTYAVDDhkAdEN+fQ9ILLp73mhzlgyyt+m48dKIos/dfbpnPwTf/DjPTiwhwlyvcO
         WDZabokkB6PpkWI1K171fFwFVmBTtw4kukOf+6f9Z2XPiHk8vdHnEFlKyRSCOtfy6+Wn
         bgsqYwrnL16/4T5KU1xwARlhZXwNFEdK3NLlCf3x/787Mx3W25qqun6QRAVlpXtC37dH
         6BrzpXfHh2Whsg0Jg0XMTlu4Ds2rd5onPwGmk5njZuk4j7UXom6mzeZP0cK30gjl9+kY
         wJbKXt3pW1/rdynuldWIpc2UF75nEDpd40+BoMldkDE5anb5go9+Qg/YqrpJBbVjbuDX
         kGtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JurTSdOp+UFrSX4hMp+B1Orm1qcT5exeX9APSpHRGFc=;
        b=d7g2VPRckS0Ws7UrL/caHIkXuhrSx3AJmC0Tlt/sUTNfm88hjW2otk7MiVrjOJBBMH
         upJd5W6Ugo3y9BkcqKFv7AXzOI+TjnVNaJesHqbnZZQxIqCfySU3g7cHPSYkXw7u4SXi
         e81fop/aCG45lN45Jy2Lipp/FhNWEkw6ydu5UjSvPR7Up4k7eMYqgTKnFLmN3rKNjMRc
         yLkSbH3pPH//PcCXVPc+u28ALfJan0JDGA6ZBwG1KLcvpxuNTfrvZSX+/yZjSUYYM3Cd
         ZEuU+zm7bJsasH3hYk1IjihA7i4YbDpiXeppX34VkW2W0FVKA11jOFkNQZIzekbl0JzH
         eZ7g==
X-Gm-Message-State: AOAM5318LHWswwoTm1X7RcaitF+eJscFsHQraSB16vCkiVPKaxmPuID5
        mipvuZeVEOicZ6pTbDVZHOM=
X-Google-Smtp-Source: ABdhPJzU+KvqpuPlba4UIOuw9CpyFr3uOieFk41afnGKCAHah2TbkjXHXybXGbLve2tDZqknNJhDBQ==
X-Received: by 2002:a05:6000:1281:: with SMTP id f1mr183005wrx.137.1624311037307;
        Mon, 21 Jun 2021 14:30:37 -0700 (PDT)
Received: from allarkin.tlv.csb ([176.230.197.133])
        by smtp.googlemail.com with ESMTPSA id u15sm618195wmq.1.2021.06.21.14.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 14:30:36 -0700 (PDT)
From:   Alexander Larkin <avlarkin82@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     avlarkin82@gmail.com, dan.carpenter@oracle.com,
        dmitry.torokhov@gmail.com, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, murray.mcallister@gmail.com,
        security@kernel.org
Subject: Re: [PATCH] Input: joydev - prevent potential write out of bounds in ioctl
Date:   Tue, 22 Jun 2021 00:30:24 +0300
Message-Id: <20210621213024.1698133-1-avlarkin82@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
References: <CAHk-=wjtK7XgQqTE_OyGV8uPX3d1RqUhTQO1D+Bk3wGEiea3Ow@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Also I did userspace test (that shows how kernel overwrites (out of array bound) the userspace):
1. The buttons is "__u16 buttons[5]" in userspace,
2. buttons[5] = 1;
3. ioctl(fd, JSIOCGBTNMAP, buttons)
4. printf("new %i\n", buttons[5]),
and the output is "new 0", so the value is being overwritten by kernel (so 1024 bytes copied
to 10 bytes buffer).

It looks like I don't understand what is the expected value of the _IOC_SIZE(cmd),
why not 10 for this read ioctl example? Is it possible to make this ioctl safe, so
it doesn't copy more data than user can handle?
