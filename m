Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 848036E724E
	for <lists+linux-input@lfdr.de>; Wed, 19 Apr 2023 06:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231349AbjDSE2s (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 19 Apr 2023 00:28:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbjDSE2p (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 19 Apr 2023 00:28:45 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48B5461A7
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 21:28:44 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-2fa2fc747easo1463859f8f.2
        for <linux-input@vger.kernel.org>; Tue, 18 Apr 2023 21:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681878523; x=1684470523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2RtqnWL4Z8C+oNa7ovUzQm+/Ia2qvlXRiHjqjbs0aE=;
        b=qi6qKuzKab0LDsi2Q4mPQnazZzHj9SZGu1Ckyg3Xg6SFOP9QbawTB2Yo3kG51ZkkvI
         Jxuv0rhQLU0RSF8d47pIh7YyweGRhDf9+KnQ2gwYcW+dnktjD5gQFlxpOS2UTZSrQBfZ
         xb6BCrIUBPLuHdJ1my3F0xtOeSs1haEFU/U1jp5eoWWog36UgKkHqDG35I/32jTORX+n
         Qm+C3E87jdZGxHw5D+4SWFGtlExPksldWbvnojdcVwtyaKonVXHEepDBmHtTrq2CsJOl
         +I4UiwU2+m/R/cMqi490DznD0qFzhyucrbvBUSn6ZOrpLmq0FggHkoXwx/laaM5vsm4h
         VUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681878523; x=1684470523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2RtqnWL4Z8C+oNa7ovUzQm+/Ia2qvlXRiHjqjbs0aE=;
        b=XFGUA818nElPrSejAYPeMsf450b9sI8IeAskrryBO/wB/Fq0bcl5PWm2cmzPse093S
         jG8K6p+vTmJGTtYyUrnP4fYn2UCVRlWG9ss91VCwcepKtvUOsIPRye74UfhCh9GXWQWE
         xS/gpUPh379BRNn3vyLYbwnnVrmFjOCkQeDctHCi0wVIFg1Nv06jb6Kp0Z5Csg28Y7SG
         Qjxb0CLcn1poj2W+k4tg4BEViKtnxmWh1lf/Zg5FX0WbTztymB/+p5IObLRAkR7YrkFN
         rjKWN2Gbe+bhmVaXBerwMbOomohH8IbbeBqGsEQVzVOo4eF1XuL2Y488WvX5dTdWQ7SH
         isqw==
X-Gm-Message-State: AAQBX9dLEnDLOvfUu/RJ5YGZNj8nxlE1MMbjXjQnoPHjfkcAwae04qKL
        hs09WkKZ7EESUzhRWtEBFmM=
X-Google-Smtp-Source: AKy350aMq2856GKBSsp81d1kAQgLYFW7Ez8iREEtwQlxKUoBBNUd2P7zUXDejqU/d5weAF/TnMuQSA==
X-Received: by 2002:a5d:498a:0:b0:2f6:981f:4ffe with SMTP id r10-20020a5d498a000000b002f6981f4ffemr3167598wrq.2.1681878522683;
        Tue, 18 Apr 2023 21:28:42 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x14-20020adfdd8e000000b002efb4f2d240sm9985177wrl.87.2023.04.18.21.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 21:28:42 -0700 (PDT)
Date:   Wed, 19 Apr 2023 07:28:38 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: xpad - Move Xbox 360 magic packet sending
Message-ID: <facb01dd-e704-4900-8f4c-6d6972e75176@kili.mountain>
References: <20230419022414.1790979-1-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230419022414.1790979-1-vi@endrift.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

On Tue, Apr 18, 2023 at 07:24:14PM -0700, Vicki Pfau wrote:
> This moves the sending of the magic packet introduced in db7220c48d8d from
> xpad_probe to xpad_start_input to ensure that xpad->dev->dev exists in the
> event that an error occurs. This should also fix issues with suspend that may
> occur with some controllers.
> 
> Fixes: db7220c48d8d ("Input: xpad - fix support for some third-party controllers")
> Signed-off-by: Vicki Pfau <vi@endrift.com>

Can you add the syzbot stuff as well and a Reported-by tag for
Dongliang Mu as well.

Reported-by: syzbot+a3f758b8d8cb7e49afec@syzkaller.appspotmail.com
Reported-by: Dongliang Mu <dzm91@hust.edu.cn>
Link: https://groups.google.com/g/syzkaller-bugs/c/iMhTgpGuIbM

regards,
dan carpenter

