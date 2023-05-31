Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1C9D717400
	for <lists+linux-input@lfdr.de>; Wed, 31 May 2023 05:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbjEaDAg (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 30 May 2023 23:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230296AbjEaDAf (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 30 May 2023 23:00:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D481F9
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 20:00:34 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af2c7f2883so55962891fa.3
        for <linux-input@vger.kernel.org>; Tue, 30 May 2023 20:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685502032; x=1688094032;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=b0iSPlEIEdT0K9oGJvI/5wIcecgeFqLpeLhBel6OeMF3EdBZYI6ifQdPl3euIJdo0k
         PMJdv8HhdRPL4YBfw2ypWly7AMEKVY2NsIMyLw1UublWw6HDCzSutkyzdzF6w5B5aVlE
         6rbKd5bevL6f7Sjpdr0cVjoERtmKw0K71wJK57Ud/S8uwy4k9+obxkVLcc2+yv0LmD5E
         LPhQH3DpK6gFibLkmqgVGpBSuAmISNTbuV/VuDoqE4Ye7lsQMJ08b/b1JM8wrqku7CBD
         zey8M0PDkKcK/gDysKkGgeGUfL57+Rn3A9GulETEIiV12TVIHpRFkGDgqQFgFUZVU059
         PnWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685502032; x=1688094032;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/rL+TycpMQLfB5P4Zn9xgGfUWg8yPCNTwrE46ZNldMM=;
        b=V2/E9RapYlApB9f6YYfDmXWtxqBoP50mYETjh5Y4SW0Z60tnHvf0WtyVBRX1J1UrEV
         jyXZlGhPdLNPONzIWrMqWRPCv5AaaczHo3z8s8ZSNJ0ZKGTHKi8GzVeBuHNFuORjn2/2
         Civg3GrcewyTd2Ms35ITkDL4NLRQvkAOJIiObFksaOBlouigMMC7nFMwix9FrjB7Mx6Z
         wFQpktum+x8QZVaGt95YdifL+DiqGD7s7ts3aHQ3YVbMJmIDK5AoL9KUxqXajQxpIRzU
         sWqHlUwq5mqaIReiaI5teeJXVfE0HZycMfSVlB9X3TovjA/AdWFcDp8eScng7ZMCWxaV
         y+8Q==
X-Gm-Message-State: AC+VfDzVibAUjAqLh23XJn/JZy2t/AJe7HL0FY/N6K4ZAfJnpP+q5mq/
        DnEEhEv2iEh2tUZQaWx41jjiiLPxDn/zRuiGlag=
X-Google-Smtp-Source: ACHHUZ5CZvMkv2I1kRF65UZXTV08WTgTXt/UwoT+xOE0O0HCDQZv9DEKmPtUZ5zkynq7KlT7hQP1LxL0yFE0a8TBGQQ=
X-Received: by 2002:a2e:a414:0:b0:2ac:dd01:e169 with SMTP id
 p20-20020a2ea414000000b002acdd01e169mr1632036ljn.40.1685502031900; Tue, 30
 May 2023 20:00:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:b601:0:b0:2ad:837f:da67 with HTTP; Tue, 30 May 2023
 20:00:31 -0700 (PDT)
Reply-To: dravasmith27@gmail.com
From:   Dr Ava Smith <hde46246@gmail.com>
Date:   Tue, 30 May 2023 20:00:31 -0700
Message-ID: <CAC1T3Q_RHGDSCU9WeKqM8arMsEQtKFwKKdpFNPeQAhEuDbBUTQ@mail.gmail.com>
Subject: GREETINGS FROM DR AVA SMITH
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:231 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4998]
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [dravasmith27[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [hde46246[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [hde46246[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.0 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
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
