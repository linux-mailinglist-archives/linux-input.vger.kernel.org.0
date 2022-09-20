Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FCA05BE7BB
	for <lists+linux-input@lfdr.de>; Tue, 20 Sep 2022 15:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231450AbiITNzi (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 20 Sep 2022 09:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231308AbiITNzP (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 20 Sep 2022 09:55:15 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB3185F11A
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:54:20 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id lc7so6487171ejb.0
        for <linux-input@vger.kernel.org>; Tue, 20 Sep 2022 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=UkTi/Rem1P9J95E9zcv2auXxJwZwB3cyFe3Frv4d+2oavnCRFvsRn28fud4mhDWygT
         Npegm+mNDkn3cgopk6qhWT5I/stNzpUY8kHgTc58XRqyORIW6Hs3LI0zFjdO6WIC4rDU
         NN2V1WdicefB5y0aNsfyBNa5YcTDGbJhUKkcEpRZc+DNffyk5lrs3Bs/EG+6D0mFBHai
         9gLKC3a0cvvDS7ZFenyMAcI1qxI+/ij8yBUAbW7vcnA9iPQCUQyq0gVs2XvSwLLyc9dz
         N7SUQh1aw6kmnc8nOqXVDGkB4vZfCuifDr24oXVwDCg7Pek8V8qOe/9U1ueByp9tLf0k
         dZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=UwntwST4zeWeN5fDfCx5EacEcL0IoTkD1VygdAFc9qMpvhf44zgiH/YFJx6EJzfP9z
         npJhNR097buNRuUyGN6x60q/a/THlRH31m7Uxv0Mlr5Vx4BJWQsaqbjBjltd1xrlKtXW
         qwzCNzAzntZHrSOEdDeIBATV/mXGBZNIhUyNT3hkky4ORtyCZ2tQ0HcN85N624M6SXte
         6m6nNQe3Xa9uSwiu4NcTB8+VTocwe1TDPF4OyB4JqOpbs9rJIdhAu5HrWa0zDr4mMpg+
         LD5YdqBZInyMLXi4hHS5OUPnq/WrdOMzK5WhREMf8XHvMWbMhDLlXjjHfxkgzt6iZPOa
         OWtg==
X-Gm-Message-State: ACrzQf3Oil4JhMlnZbFWJWLwOlNBcspSwmoi0f7nnqIhjp0Ac/933ubc
        8SGuWv1y/Jyk7Xa7SAS82zx3VEDxvrpXN8iBNWc=
X-Google-Smtp-Source: AMsMyM7dkC93OIudzQstPDnXym2QHAZQurBQjX7LoUqpO4IaokxtxpbbbgEYsJNTV7LkIkm3q+W4oIv+fhw/I1Y09Yk=
X-Received: by 2002:a17:907:a079:b0:770:78cb:6650 with SMTP id
 ia25-20020a170907a07900b0077078cb6650mr16901679ejc.515.1663682059001; Tue, 20
 Sep 2022 06:54:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a50:49d:0:b0:1d8:9ed7:a097 with HTTP; Tue, 20 Sep 2022
 06:54:18 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <edithbrown047@gmail.com>
Date:   Tue, 20 Sep 2022 14:54:18 +0100
Message-ID: <CAFM-KKYjG3HF6U9wFb-au0pG7=P+1aNZkSzupsKMvBfJ6EXFBQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:632 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4873]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [edithbrown047[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [edithbrown047[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [linadavid0089[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

-- 
Hello,
how are you?
