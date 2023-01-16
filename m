Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8259566BB0F
	for <lists+linux-input@lfdr.de>; Mon, 16 Jan 2023 10:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbjAPJ5P (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Mon, 16 Jan 2023 04:57:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjAPJ47 (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Mon, 16 Jan 2023 04:56:59 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FF017CEB
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 01:56:57 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id w2so5160138pfc.11
        for <linux-input@vger.kernel.org>; Mon, 16 Jan 2023 01:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=LrYe8cgH22lHSf4fm+QzthKAKcmvVkkaaYrFIoBdx75XUSStM4Wccvgq74J2i5fgh0
         hmynDINAv7viKKx+SfBlUpMzH+EKG1MRm3Cj+Wz2OyPhrQlYy7y63plAEfdfib8UfHXf
         1qQmrUadL6rCD2574HW3C+SVRSDbZprSNdAzpczdzqaNnQJBrHIDN3KVxgXoIZpe1Y0i
         1RdBjIHastRoKT3sYEX7JEUlyl3z0xARwfIkMrh8qsdPHuAXGbj3s3l9I8PTHVE2Sb5r
         Ewdzay3z8BzSHyyU7hXcNEt8ZJYnBs5qm66Ln2KBsCnG84k31j1u7AJNNvZX71rb7kht
         s2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddKdS4x8c4ZSI9PbKdla4xMHlbecpUYnHnf7KqPY/v4=;
        b=hsqulhM7zGmA2tsDT4lfs+iz7zEtqrecZqCfW4RdyRUTEbHjiWrCKS15sxpo/iOMG2
         uwEp4DH6F8S59YCVQbyG9HOte1bY8/x+I9aaOInl7UnU6EIZXsjpOCN6/7oUua7qvDxe
         E9tRi7gyG8DCPqhU5N0vvB1A0XO9zksr5DK+oAVEGzkuA4LzB7MN28Ep0vborgnmHSlX
         arWV42K2/bhVjoicgcV5NvyoPhdrZG238oR12ZNHcwZpnLRF9aLW2sAae+gJcEeqf0J6
         Wt/o84wqeQPLI9lLCywHT49FaT80bforamduVz6rlbBZWgmxP1Fd8lSofK+LqmnFdtPS
         micg==
X-Gm-Message-State: AFqh2krRagtCA8TFpAmH7YbgC39i5lXGBSBjhtZMWvZv1ut8NhXCGwZ6
        W8cNxi820kOYdwcqckqc6cbr0OMQVbjCwiXpoFs=
X-Google-Smtp-Source: AMrXdXty2WR2Oz7dh5X5W8543mnWuHPh2Mr5HQIe0treIxIhUb+AYyjBlD7GG82i/EyLDJAEdY8XExDgb2g9fwGnhvE=
X-Received: by 2002:a63:1407:0:b0:470:48c1:aae9 with SMTP id
 u7-20020a631407000000b0047048c1aae9mr6787063pgl.4.1673863016553; Mon, 16 Jan
 2023 01:56:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7301:3716:b0:97:bb2e:c515 with HTTP; Mon, 16 Jan 2023
 01:56:56 -0800 (PST)
Reply-To: subik7633@gmail.com
From:   Susan Bikarm <biksusan825@gmail.com>
Date:   Mon, 16 Jan 2023 01:56:56 -0800
Message-ID: <CAP0wf6ypzNU8rzEueJU95Fi-iV3JFAEsPX1UyNOqaq1YGwOPWA@mail.gmail.com>
Subject: Please can i have your attention
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

Dear ,

Please can I have your attention and possibly help me for humanity's
sake please. I am writing this message with a heavy heart filled with
sorrows and sadness.
Please if you can respond, i have an issue that i will be most
grateful if you could help me deal with it please.

Susan
