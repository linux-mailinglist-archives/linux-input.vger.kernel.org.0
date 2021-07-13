Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE8A3C7A33
	for <lists+linux-input@lfdr.de>; Wed, 14 Jul 2021 01:31:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236794AbhGMXeY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 13 Jul 2021 19:34:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236769AbhGMXeY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 13 Jul 2021 19:34:24 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF70C0613DD
        for <linux-input@vger.kernel.org>; Tue, 13 Jul 2021 16:31:34 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id me13-20020a17090b17cdb0290173bac8b9c9so2322185pjb.3
        for <linux-input@vger.kernel.org>; Tue, 13 Jul 2021 16:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mk9ZnRE6EkcXVOQbWGno/mEiDaYUbs7KtCQa7eCeks4=;
        b=oMrAdpfVk0reEpamq5xF1h3mYR0r1bTt8fJOegO82CPm8J01HEofJF4IteM2Fc09cG
         Ia3T2SFGjz8hK6lU7m/xzd+hvr64P8ZZvCBejKb6RzYSeLk6y9zPvgUJpBi57b5bNyUT
         geT/nqHafVuCiTRnzzunTkmo2Od4znh99gpGPnIa8dp8jhJfX01WXXPpaMXIdMJm1iYq
         sdY9hwwC9qA3JOrithrigCWadComBGp0CI+kEv3G3NoDmPCwWb9w8T9uiqhAxrwK6GdG
         CHilFC7+syUo8Nht6syCk8LlHm04CT+ePxmQSINUq42ikt90b7/2s/VipQPFVmnA35FF
         BndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mk9ZnRE6EkcXVOQbWGno/mEiDaYUbs7KtCQa7eCeks4=;
        b=WlKm/2cgndxLPU5CwWlxBq0pxfnlcUBnbszrhgHqiw5HltXuzPwtJvhbWlWXrb03H+
         XeQaouSiAS3UBMQvpis3DyD69CLjmPEyyVUeo7585avH3i/RUKDaoJJewKLZPCcGkHg7
         mQNYmMETv37R8ycI5l3962Zn5FNtw79Ijp2s4OH0Twm7oP8jUZ6VU64zgxB8BMpppYu0
         aQgDyFv/5/XzQ8RjH56srA5pgTOmUBH88O4QtTFbHYhe6NtTH7QtLYqLLY61WYszyToz
         5bsekxj5h5smjHzJmi3+dxE6pma7+sUF+2+k0clrExqqs23rfImyzMjD5orvc4HnMfhC
         k44Q==
X-Gm-Message-State: AOAM533pKer+fNkW2KL73TknJTTUwbm4RErbAHDwR5Uojn9a4j+UVOW1
        V3MVZ4/PT0eCG7TBDhUrxhk=
X-Google-Smtp-Source: ABdhPJyVsllPZ0q0+UaXi+GvfL+KnBKNzFoC/dYjrQMAczHzWhdhEmPOckHnTGM2ulMRsI1FfxjOZA==
X-Received: by 2002:a17:902:bd81:b029:129:8eb1:c909 with SMTP id q1-20020a170902bd81b02901298eb1c909mr5616480pls.30.1626219093731;
        Tue, 13 Jul 2021 16:31:33 -0700 (PDT)
Received: from envious.. (c-71-236-190-222.hsd1.or.comcast.net. [71.236.190.222])
        by smtp.gmail.com with ESMTPSA id p53sm244508pfw.168.2021.07.13.16.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 16:31:33 -0700 (PDT)
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
To:     ecstaticmorse@gmail.com
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, jikos@kernel.org,
        linux-input@vger.kernel.org, shyam-sundar.s-k@amd.com
Subject: 
Date:   Tue, 13 Jul 2021 16:31:06 -0700
Message-Id: <20210713233106.9168-1-ecstaticmorse@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210713041121.13418-1-ecstaticmorse@gmail.com>
References: <20210713041121.13418-1-ecstaticmorse@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Added missing signoff


