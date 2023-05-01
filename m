Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1004C6F3A52
	for <lists+linux-input@lfdr.de>; Tue,  2 May 2023 00:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231903AbjEAWLM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 1 May 2023 18:11:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjEAWLL (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Mon, 1 May 2023 18:11:11 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAA341FEB
        for <linux-input@vger.kernel.org>; Mon,  1 May 2023 15:11:10 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-24df4ecdb87so1219954a91.0
        for <linux-input@vger.kernel.org>; Mon, 01 May 2023 15:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682979070; x=1685571070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qZIzTcFqPyBAaQTd0NSVgs9kKBvqGfZ+KBNzCtVkBMk=;
        b=P5F6oIHTXAdX7UghOW0zcqlSBlNDuCZN8k3ZhYPqtogA9WDA30UyRsowFFS6G6bm6e
         Yf6RYVpZ2NRHitV61JtZvmyWkfxIT2J7i6XUnCGGre0Awk5UPTBAEXq/9FDL+2DhX3J9
         4KtC48q1Gw5zl6H2t+jHGi4c6SXqFrEWq/zMM2TGW0Bvt9HxflLaPbxKC5GEO0dtAE4H
         WoDaS/r6FM/SXCZDU4QOZaZCcCnmzXBqQR2qFZP6msDCt8Thoy3MGhghrrXZk9wdYwy6
         lTZN5Be8kJWzASuCY4INSuI/EW3lv14LTTHMFRYaOS6t8vckWV6YLVji6bH2L5kOcZAA
         HdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682979070; x=1685571070;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qZIzTcFqPyBAaQTd0NSVgs9kKBvqGfZ+KBNzCtVkBMk=;
        b=Sw6K845bbGLEAmsxpSuZDB3ppumaiuAEOVE61c9accfJfEgpwUZYXFBsJtGJ8HT6y6
         2/WRHY3VO9ql2ZdstDKmA1LWUOMAQZYLngte4Jwp+iFExaZbu519+EFhnt+msxw1PICt
         0HldaOcLgs6pNhrZ20rjCR/qFwngpWsZ6ARgihNiSyditThArFxuvwFJE2fHBStuey6l
         jmORnYUXptjEs+0B2SmK/LsSxV2o3A4HEH5HK6KneAD5fjj3GNsx2POwfmkrqBiBDRqP
         iC1y8Ajlr9FmsdT0HrIboXwaYq2yg8lzLZPnLHRTlYQH4DSur/Q5SVbMSj3TjuUtqUlA
         KMbg==
X-Gm-Message-State: AC+VfDxGBeXJr2/CZt9RWDp+osvQcu1I0UUxuD9hqcwLicMCSPBq1VgO
        0deDSmn/uushN2LzzfJ96T0=
X-Google-Smtp-Source: ACHHUZ7AAit3+phkaU+pncZmMv2RK6Wi0BQYE38X7FaQBVMtODxLlWAL1znZ/8oVuGpvBQelCYyqOA==
X-Received: by 2002:a17:903:1112:b0:1ab:a30:c89d with SMTP id n18-20020a170903111200b001ab0a30c89dmr270456plh.51.1682979070143;
        Mon, 01 May 2023 15:11:10 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:b6ce:736b:e4f7:adb])
        by smtp.gmail.com with ESMTPSA id q11-20020a170902bd8b00b001a96a6877fdsm14258056pls.3.2023.05.01.15.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:11:09 -0700 (PDT)
Date:   Mon, 1 May 2023 15:11:06 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Dan Carpenter <error27@gmail.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Move Xbox 360 magic packet sending
Message-ID: <ZFA4+ly5e3ggLFP4@google.com>
References: <20230419022414.1790979-1-vi@endrift.com>
 <facb01dd-e704-4900-8f4c-6d6972e75176@kili.mountain>
 <2be8ff85-57d3-fd80-adcd-a7dc50c2e27d@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2be8ff85-57d3-fd80-adcd-a7dc50c2e27d@endrift.com>
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Fri, Apr 28, 2023 at 04:15:01PM -0700, Vicki Pfau wrote:
> Hi Dmitry,
> 
> On 4/18/23 21:28, Dan Carpenter wrote:
> > On Tue, Apr 18, 2023 at 07:24:14PM -0700, Vicki Pfau wrote:
> >> This moves the sending of the magic packet introduced in db7220c48d8d from
> >> xpad_probe to xpad_start_input to ensure that xpad->dev->dev exists in the
> >> event that an error occurs. This should also fix issues with suspend that may
> >> occur with some controllers.
> >>
> >> Fixes: db7220c48d8d ("Input: xpad - fix support for some third-party controllers")
> >> Signed-off-by: Vicki Pfau <vi@endrift.com>
> > 
> > Can you add the syzbot stuff as well and a Reported-by tag for
> > Dongliang Mu as well.
> > 
> > Reported-by: syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
> > Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
> > Link: https://groups.google.com/g/syzkaller-bugs/c/iMhTgpGuIbM
> 
> Do I need to add these to the commit myself and resend, or, barring code revisions, can this be added when you cherry-pick into the tree?
> 

This not only have not been tested on hardware, it was not even
compiled:

  CC [M]  drivers/input/joystick/xpad.o
  drivers/input/joystick/xpad.c: In function ‘xpad_start_input’:
  drivers/input/joystick/xpad.c:1733:46: error: ‘udev’ undeclared (first use in this function); did you mean ‘cdev’?
   1733 |                 error = usb_control_msg_recv(udev, 0,
        |                                              ^~~~
        |                                              cdev


At this point I will simply revert the original patch introducing the issue and
we can try landing this again once it is all rested.

Thanks.

-- 
Dmitry
