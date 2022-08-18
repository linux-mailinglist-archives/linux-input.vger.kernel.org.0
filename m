Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE5895987B3
	for <lists+linux-input@lfdr.de>; Thu, 18 Aug 2022 17:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344024AbiHRPo2 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Thu, 18 Aug 2022 11:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235036AbiHRPoV (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Thu, 18 Aug 2022 11:44:21 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF6C985A9
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 08:44:20 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b16so2403602edd.4
        for <linux-input@vger.kernel.org>; Thu, 18 Aug 2022 08:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=TRxU1P7THyFhhKZgXitDN8KOd+4sOzeIBlXkQyW7RrM=;
        b=FrAIqknVs5U70jW+9RQtKpuH9bYyalAVd7uhZYU7sK1pnR4aNXZyh3nXdx+3lbmRhS
         mMlgrYIXVr5/DEgcHIUIFwc75YqOejzSr5AkdyLxREnC1WDJLNgBM0Zr/G+0NiT6KMov
         AEiTWk8kCmU/6cyzvomQFTUYczNL6uPfrwxEJWP1Nqf1F9iEwpBaLcn5GAJiQLG9NiZ3
         8xXdlw6xGZ1WOF745Y23w8WunkHiwEDhDcfh+aRvWGi8BgOJSl3oUAqgH2ppRgLnY1X2
         sErTBvXwq3AMjVSlFyDQaS+HtS+/pl0pTQBWQgPG4KMliqvYdI1fWQy8dxU/nFwIqivf
         obqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=TRxU1P7THyFhhKZgXitDN8KOd+4sOzeIBlXkQyW7RrM=;
        b=oNbTmYAbToqIrjOXuL0wUJhZqX/SXpJ3/DemPqxxv+J4Jm0ppYr7GZXnCZDSdI/+/c
         9yC6l7HmpcEiPOgIIPLabT7u19BMV84WK5k/mZYa+ybs3kIMoks7NhdqjZTPMBd4LkKb
         R9cVe/J1ELom0x3B7RsrSfh5ew/VYN5anePuQ2ZSeFKd2QSQ6xCTlLt9XVncG33+2z2+
         24j0VMvzkgeoA9CwUJJ7xK/jhCBp14pwiCq0MH5U8Tv5Qt2ke1EdrjsKAt+pue0f4UHa
         8zluBszq9ekDExZiTYfk0FIi5vB0UeXGDlDkkx0H0krxBxdlsgfYJlmFiwouTtpsP/G6
         RNCg==
X-Gm-Message-State: ACgBeo3I6ohre0P+2VuVfJ71/D+qAVk59bdLqBDcZZqS69Gz81TlGDS7
        0fVrDlv+cDOpRh40hXzjTeTO+loEbVuTOA==
X-Google-Smtp-Source: AA6agR7K9Nwy5O7j88ecbAwQeGiTrZ4jPBovW7Co3oXsWs/h2hjR3Oz+ZsYvAIRACatgCv+6wMKz9Q==
X-Received: by 2002:a50:ed06:0:b0:445:e986:599e with SMTP id j6-20020a50ed06000000b00445e986599emr2823356eds.10.1660837458495;
        Thu, 18 Aug 2022 08:44:18 -0700 (PDT)
Received: from deepwhite.fritz.box ([2001:9e8:220d:e00:f78b:3e64:f8af:69ef])
        by smtp.gmail.com with ESMTPSA id v1-20020a170906292100b0073a62f3b447sm997486ejd.44.2022.08.18.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Aug 2022 08:44:18 -0700 (PDT)
From:   Pavel Rojtberg <rojtberg@gmail.com>
X-Google-Original-From: Pavel Rojtberg < rojtberg@gmail.com >
To:     linux-input@vger.kernel.org, dmitry.torokhov@gmail.com,
        gregkh@linuxfoundation.org
Cc:     Pavel Rojtberg <rojtberg@gmail.com>
Subject: [PATCH v2 0/4] Input: xpad - sync with github fork
Date:   Thu, 18 Aug 2022 17:44:07 +0200
Message-Id: <20220818154411.510308-1-rojtberg@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

From: Pavel Rojtberg <rojtberg@gmail.com>

I maintain the fork of the xpad driver at https://github.com/paroj/xpad.
This upstreams some changes that have proven to be stable.

The first patch merely updates the list of supported devices.

The next two patches improve xbox360w gamepad support.
I have tested those myself, as I own that device.

The last patch carries most of the diff and adds support for
"paddle" buttons found on some Xbox One controllers.

Compared to v1, this adds the requested tags to the first
two patches of the series.

Cameron Gutman (1):
  Input: xpad - fix wireless 360 controller breaking after suspend

Christopher Crockett (1):
  Input: xpad - add support for XBOX One Elite paddles

Pavel Rojtberg (1):
  Input: xpad - add supported devices as contributed on github

Santosh De Massari (1):
  Input: xpad - Poweroff XBOX360W on mode button long press

 drivers/input/joystick/xpad.c | 298 +++++++++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 236 insertions(+), 62 deletions(-)

-- 
2.34.1

