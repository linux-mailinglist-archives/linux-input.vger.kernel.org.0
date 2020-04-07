Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82F2D1A0E84
	for <lists+linux-input@lfdr.de>; Tue,  7 Apr 2020 15:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728892AbgDGNke (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 7 Apr 2020 09:40:34 -0400
Received: from mout.web.de ([212.227.17.11]:42237 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728482AbgDGNkd (ORCPT <rfc822;linux-input@vger.kernel.org>);
        Tue, 7 Apr 2020 09:40:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1586266808;
        bh=wy76oq8KCgEwXdYif7uJShy8C2Ps/DyDiTXFWlFtNMY=;
        h=X-UI-Sender-Class:Cc:Subject:To:From:Date;
        b=oSJzxBnn4vhCYn62WevBxUaOP1NgFPmC2+c75MDN/5v3KDbGkIjCQ3DEEZ/uz2urm
         JH1dNa3hE3qApjk8ASV+yquVcLDjMizERoidKwNu4sFgrVgGanad6+T5ubbaiPumQS
         3a0RMpMuZQEBVn7ogX01zvfWSWQvnNQzdGNuZjf0=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.3] ([78.49.5.104]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MPHC8-1jQEIq1CzY-004Vq2; Tue, 07
 Apr 2020 15:40:08 +0200
Cc:     linux-kernel@vger.kernel.org, lkp@intel.com,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH v4 4/4] Input: adp5589: Fix possible memory leak of 'kpad'
To:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        linux-input@vger.kernel.org
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <5250434e-d83a-908e-ec7e-c84212e67e85@web.de>
Date:   Tue, 7 Apr 2020 15:40:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JIKi0lZOvEUMzIt/JkZxnLFJdCrY++MFGsHFIqjD6Ucf1jTXaXH
 XgDtyHosdrDCfXt8Konyqj5lv4ANqpP2NS/aM+yqI/dee0PgnZ7iVz1aRcycvOlj6DzV55D
 y02m7b0NlR7lqqKJA5O33g1JCUWRuizOwW6qm/f5PU3asUt7jkU7FZNKZN35nqmqxm4eh/K
 FYkwUFKijlRWTDYmwzkQA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0fLofmPuvCY=:yXav0xqOeyPqNKOx7VDHbP
 fbqxDDVOUjkYZjMoLJEcCyVUfplcK1ZehAoMexwIF9dUNx1GbVrlKd4OA15sA43wz8cCR2AAz
 YAMH7bOoTteZAq4VL8QLzG8cRxPU7i/RbAePFIG6dnQxKVAqifwCd0T0NUCGLVMtQQpVce3dQ
 acbJ96Un8G5KgPLXcu4XhCnolR4cn9dx4SH1BtE/I3FW8ttzQL93OMBf0rJC5310ESGm7RJ8J
 ggFXGCh2mCRomayfZH0IOC2jZQ2rwvkEe/SVYMgKSU78QtRbCcBgGYwO2LhR6c0Mriaq71vii
 Rz4AiS4QwpeXHi0Uu0cHZY+4aMeHnFiTEq5C44gys9Z5TFKJMPx63KOJLGGRfN2fMgq1CVW3N
 v1leXdgoghP8KH8Zk1QKH/RFp8Rtc7g7IgF9UNp4JpnNkyPSp6nQmO2qZ7S9mtC3k++oK2d7L
 z34T/Fu3hObNayuS42niVttZ6JeDHra7e3/D6cH1AqENpRpcixq6iOSBPL2aiQwEgiHN2E/7K
 wsb+aiFr/LTk2SiDK2fVX+mTCydThWEmEgzVYOoI67YsKqLPnHRi21CbIN87e1PiAgSQMzuNz
 N5sTPYwS6bwu0bDjkG1A5RdMwqAOrxNtkYB9VqxlDwQY+MrISsoWIxCwSabBC52i3ZS4z73iW
 SGhoL8+aNYTmmkBdxk6rAg2FjU6UG4u8urdDhiDalkSM8bnLskQmPsK5Iis7nVPWnaHtZlul8
 xYL7btcnmc/fVOFL0ABhFTQBcYd5nRt+ECO416PaoD5bUzJoUh00wGC56+laI8nabpeoDA+E9
 o4lugttJOGYG9jWnWckUx1ISPRXD/2KLBhSVUkQjrc3E43ROXrRjQvIJTKzmNWhUIc9l+7Rap
 JrZprBJgXBt1/aPf92OVmvPO+c1+REVSe8l6i6kjmz8DxWODe3g51/WM8mQI/wteh+l1eL6LI
 H/CM76A5KPQ1RMB4NxU7RsCN2qs8KcvWDnbCsnwE2oI+EJJFD94qt6SAlKsnXTE9V4y9pNcRw
 PKrG/+GSoBAVSrJkb8W3Q7IO11lLH+I/86wndjdho9AKiWSw9MRTO36qWbEn4Kvc5O63Gf062
 MRn1YXnxQWxHlAv0GYlCAPNUQOG2DBSJZeKWmaXyfvQoIEoD2l4T5po8rxONJXVoZelmB/VkY
 EAAUztPGNwNx1vMm40HVv76DYPYc1Js7oQZ6q6wlxhWCpXQ32c71DGDpt5twWxnzBnBh5tDh6
 AlAcJjNXJ7bFP0Vlu
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

> If 'adp5589_i2c_get_driver_data()' returns an error, the exit path shoul=
d
> be to also free the 'kpad' object.

Wording alternative:
Release the kpad object also after a failed call of
the function =E2=80=9Cadp5589_i2c_get_driver_data=E2=80=9D.


> This change fixes that.

Please replace this sentence by the tag =E2=80=9CFixes=E2=80=9D
(because the exception handling was improved).

Regards,
Markus
