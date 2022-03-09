Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709614D2884
	for <lists+linux-input@lfdr.de>; Wed,  9 Mar 2022 06:37:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbiCIFiV (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 9 Mar 2022 00:38:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229729AbiCIFiT (ORCPT
        <rfc822;linux-input@vger.kernel.org>); Wed, 9 Mar 2022 00:38:19 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4009161126
        for <linux-input@vger.kernel.org>; Tue,  8 Mar 2022 21:37:20 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id az23so726638vkb.0
        for <linux-input@vger.kernel.org>; Tue, 08 Mar 2022 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=EZ3VRlscbHNxeupChd7hSIEUjJgJexqvIEZPjdNF0ybspTpU30/zQb2jYzFZXlIIsw
         MrVxstkLFktj8HD2pWAAcLqR7jTD5NYIaptfI1/TYsA2v1ylcLUw+0Cu2mbIc0oWaiG0
         C8lAzdlayz9/mom9LPTYL49fW96ACdVu1pHkDr5Cz5x3MpPHv0bp0rhZMIPYeaNdjVfH
         IkntB0vBVvgFx5WwRl91t3R4DyNHDWLJ+6G0jI2Wp9j+n44+v71XzJ1QFZDP4N6P5VAx
         XHmHl7FNloPi42wqaPH7pHL8OYNl17VCAIFkMiEWwa3QifE1u7o6j+cBonxO0PVScxII
         r0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=diZ3UITdzODA6hGW36X5fYgCQfaVLgSUqPiQxq3sBzGR4aJIFMe5Kgk19RmfmHmU9y
         tGTCPvRVEZ4F0ABE3jmouOMDq5s1OL25qIm+HpSPf36p4CYoyGKQCBxCT75DzS5vN13J
         aiKqFciZOV+8PBRXdIjOnvDuJaoRp4HAGQJQ3TJxgUmgvkgTqofpUz0OdgfFO/4sZq8e
         2vt3fRQN9QZXIr8VV1rrXa4akFBvhd3yUZQP24GjNtG+Ssux8JpTPek52/QviCu5JD+J
         InCWtJwFrEDtNzUVaZ1m/jG4wUwlNwX1L9L78L+ddHJulrECfWyYrCZCXPvGyGlzVKeM
         OwGA==
X-Gm-Message-State: AOAM532ZUNytJsBiCDM4mJrq2QwhzSgTLRmace06wkH8wD9e5uVmJb19
        CRYo2rpuEInU/OgEXljEeNZZfJTREEhCKZZCL3I=
X-Google-Smtp-Source: ABdhPJz6T3f29ttJodvRQ2fOXa2vgF7zT6Q4IXxQysmc3jj9nKwb81++b5PzoZh9jaZjpHVnbjR/1lIbIGg/WWoldeQ=
X-Received: by 2002:a05:6122:50e:b0:336:8ebe:e3db with SMTP id
 x14-20020a056122050e00b003368ebee3dbmr1822511vko.10.1646804239725; Tue, 08
 Mar 2022 21:37:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a67:a205:0:0:0:0:0 with HTTP; Tue, 8 Mar 2022 21:37:19 -0800 (PST)
Reply-To: avamedicinemed3@gmail.com
From:   Dr Ava Smith <rikanbona@gmail.com>
Date:   Tue, 8 Mar 2022 21:37:19 -0800
Message-ID: <CAJHvJ=SHKP6e_BMu6TDpML3XOCfA2YZB-+wHKrqrJ_3OZRwYDA@mail.gmail.com>
Subject: From Dr Ava Smith from United States
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello Dear,
how are you today?hope you are fine
My name is Dr Ava Smith ,Am an English and French nationalities.
I will give you pictures and more details about me as soon as i hear from you
Thanks
Ava
