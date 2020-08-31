Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B94257149
	for <lists+linux-input@lfdr.de>; Mon, 31 Aug 2020 02:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgHaAtM (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sun, 30 Aug 2020 20:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbgHaAtL (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sun, 30 Aug 2020 20:49:11 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83709C061573;
        Sun, 30 Aug 2020 17:49:11 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id kx11so2106138pjb.5;
        Sun, 30 Aug 2020 17:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zM8H7Z3glzIjzn0hJ89OOErP7vLMcgPSqm3FjbGvbrI=;
        b=ZhqAeCdVUnD0ML+YwAxTvkFvSaRbQBtI1pMbOjfF5NylLNwVE8D0VitYmmxjVD9Nrj
         IF2/iDQeKs8qzzfHxTlMpGpDYYaMpZv9nxzoB6ioBvgOGuGBTwb0Ne44k/O0qtsHbfcH
         udgoyru4QB4Vswkn09celQ129hl1z7r9KImmUem9hDjRwVHY1a5JUyn/186ttc6XTA5T
         /SE4bSTTSDTUlb3R9BK+MFh24a21BjZP3BIibYGrPn2gqgJftH2z/XtWIS4KJnt9ncld
         vOBzDblHlo7HmU28927VgBZr49xKx0qKrYzzwONOibQWxysLUQs0ENwmJZvHiwLV6f/U
         gFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zM8H7Z3glzIjzn0hJ89OOErP7vLMcgPSqm3FjbGvbrI=;
        b=hoAXE5/R6Ue/vR6kDF60Zwmj8abTALizrI9xMOuu9nIKZoHsXWcTgVaCVYBJRUuzqJ
         THBzk/yOPTxZoB/HlbZ2PbtEURlUSwpzQWtdjhO/rCy5+e6rWirgeJlyJbxErMdIqi/t
         cxUATKds89WkLy3XBjoVRxroy9ib3O6xb/tpzL5axVpMCt8gC2TiznLQUnwN1JXKd+UR
         Skv/RKc+FXARQvxv4qG81XJh2Tcmp5rlXYVyp2V6xndbKQd/eTbZTV7LmoE26SumiOmU
         092rJb7AaV5oMMIO96ZEQbprT3G0/939i6YY9ZqvkazfFM+CumBF3vSrh0u2dDdK5rtK
         omBA==
X-Gm-Message-State: AOAM533CS6kyXZgvaPhKPXqunZ/mV/CwjU+3aGVQeXKAaJvcmSHIpm/9
        6BSOCLtskqxAcUci8BMliwB+wKwWcpO+6g==
X-Google-Smtp-Source: ABdhPJz0G3t8ycKIW+omakebqNhiudvuczNPaHQsjyduCMIwMzzZetqL5/TdibpANI5UszzfAmOZ7Q==
X-Received: by 2002:a17:902:8bc1:: with SMTP id r1mr6863999plo.328.1598834951040;
        Sun, 30 Aug 2020 17:49:11 -0700 (PDT)
Received: from billa.force10networks.com (c-73-231-197-145.hsd1.ca.comcast.net. [73.231.197.145])
        by smtp.gmail.com with ESMTPSA id u2sm5161140pjj.57.2020.08.30.17.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2020 17:49:10 -0700 (PDT)
From:   Nirenjan Krishnan <nirenjan@gmail.com>
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH resend v1] HID: quirks: Set INCREMENT_USAGE_ON_DUPLICATE for all Saitek X52 devices
Date:   Sun, 30 Aug 2020 17:48:58 -0700
Message-Id: <20200831004859.493827-1-nirenjan@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

This patch seems to have fallen through the cracks. Sending it again for
review.

Thanks and regards,
Nirenjan Krishnan


