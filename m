Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B27EB3B508A
	for <lists+linux-input@lfdr.de>; Sun, 27 Jun 2021 01:34:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbhFZXg5 (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Sat, 26 Jun 2021 19:36:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbhFZXg5 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Sat, 26 Jun 2021 19:36:57 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D9F1C061574
        for <linux-input@vger.kernel.org>; Sat, 26 Jun 2021 16:34:34 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id i6so10708099pfq.1
        for <linux-input@vger.kernel.org>; Sat, 26 Jun 2021 16:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=s8N2p8L5R1nG2E0L2JYaFBMMPQDbT9/NBvassGgx7tA=;
        b=g8kF88cfVzNu+D66itZ0zykP+q476q75XBjceWJJb8rJDGcEcFVd2Zpd0l6B548OWs
         JNx1+1qlJd8xUNCv3Glw3KVC/VHPLVYyuG6LvhhIZEhZhOC5AtEe+uRURuu495PBpQOu
         oEZbeJ9Kox7BQTUX1pcQDBKteJbxySe8w7zd/LR5H69+fLI9O/2ppRZ2WpZxCjHY+Bf5
         qR0Iiw/ssP8M5lM+5V4BAgPlgoBj7qsSQKOctki6zfZUhlF3W97NsAH6ivM7zLoegS3z
         H4RRCk13NKqJ7rM+lxuFlbdGl9u51HfhAhwgcK3NsLjzH1HaQmiJqcVFtZfhzdFwYUUu
         yc0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=s8N2p8L5R1nG2E0L2JYaFBMMPQDbT9/NBvassGgx7tA=;
        b=X3PiTef3y8yNhWwmF5czrq2k6EoOlPbrkthLRZI9rzZ8sEWBqjQeZPlw82oFTW1NPD
         a8HTj9CMg5EJxr5TC0xw0MtuepvelpK6C5qIfTD/cgdNyO3LTq5kneZ0NlZ6fwr7xmgN
         WZKnviZQ6OfqlAd+WFpeVJsEgWUm51t1ExGIM+ZkifkgQnL0YFpUMGXRCKaysHUz/0VW
         2pVwCmVD4NL9mnpLTb9MbWym+613u76NbHdvMhFyCofFwIOFmv98NabqH1jdD83btgyA
         ShTaH3gcdZ7TfOi1Vf9INqoy2p74E+OHRwkcENGkCFa0PFMqTVvxVvM/6y+fakFnbtvS
         iyng==
X-Gm-Message-State: AOAM530sDO5TayVzWr09Hm3ejUAk8tSbadWabHigEAnNjj1OgJ4OE64q
        4T3la8QXqpjmUK/ckHgdnWrDhZCRwmfuLLSSs9w=
X-Google-Smtp-Source: ABdhPJyycYNIXjx5w9c7Bf16O5J70tFoAbfiJnflbD8BF4h4re9r/8wQjCDV7zAFwKTkmFnHVRyv3drxxd7Y+c1iFg0=
X-Received: by 2002:a62:8fc3:0:b029:304:7b0a:a2b7 with SMTP id
 n186-20020a628fc30000b02903047b0aa2b7mr17414717pfd.46.1624750472052; Sat, 26
 Jun 2021 16:34:32 -0700 (PDT)
MIME-Version: 1.0
From:   Dylan MacKenzie <ecstaticmorse@gmail.com>
Date:   Sat, 26 Jun 2021 16:34:21 -0700
Message-ID: <CAHpHHjbnhAnhkq-G1UbtjP=SB24FVnEtsXqkT8_ZTb7UD8j_kA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add SFH sensor support for newer AMD platforms
To:     jikos@kernel.org
Cc:     Basavaraj.Natikar@amd.com, Nehal-Bakulchandra.shah@amd.com,
        benjamin.tissoires@redhat.com, linux-input@vger.kernel.org,
        shyam-sundar.s-k@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> Now queued in for-5.14/amd-sfh. Thanks,

FYI, this patch still uses the wrong register in `amd_sensor_stop_v2`.
Basavaraj confirmed this, but my email client didn't CC the list for
that conversation. Whoops!

Also, I've tested this locally on an HP Envy x360 with a Ryzen 4700U
(Renoir) and it doesn't work even though the new code paths are taken.
My `activecontrolstatus`, the register containing the sensor mask
along with the newly checked hardware ID in the lower four bits, is
`0x002bdff2`. Just like before, three IIO devices are initialized, but
the first read from the DMA buffers returns a constant, garbage value,
and all subsequent reads return zeroes. I assume that this patch is
working on whatever hardware the OP is using to test. Should it be
working on all Renoir systems?
