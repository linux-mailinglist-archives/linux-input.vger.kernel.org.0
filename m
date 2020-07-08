Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3476219480
	for <lists+linux-input@lfdr.de>; Thu,  9 Jul 2020 01:43:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726122AbgGHXnY (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Wed, 8 Jul 2020 19:43:24 -0400
Received: from sonic315-14.consmr.mail.bf2.yahoo.com ([74.6.134.124]:46104
        "EHLO sonic315-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726044AbgGHXnY (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Wed, 8 Jul 2020 19:43:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1594251803; bh=NajTNMrfMLb6UXcjRhYpYerQX8PtVBLz0oFgaMINSWY=; h=Date:From:Reply-To:Subject:References:From:Subject; b=HN/tC86bgd9/bl0s6IeF7/tTIZBIL2DEL9PrwfD4kVUQ1LMi5I6lm6FBpl/KwSFQtXb2wamnZsFd3+s5GQLHbvZWMPE6bXjI4LmWKNNPYvKpNYd3sAjlI0CyjTzL7o7u1puNU63WnQ1Z8M2eFD+rWQf552GdEtjWNou67aqixJruaCX5ShsT3Z4RDlSHK5DpnRLtjFprtIRwEAypKTAIpUorNSa6zq1lHcRWnnXxxYQ9EbLBfXzINd6YFYAXmFhNLal23cmRn1UKz9oOCp9M6AfdyUoMonpp1c/aM3uh4Jcp4jFAzT1qY+KjeNt92/9HQmgroPrObTyzEMWxbOrsvw==
X-YMail-OSG: ApNgELwVM1n3OnKggDcyUQbs6uDdswzcjNLrTQsL0FqezVfk.7hmyNK3PaHUDN0
 Fsn_WbNiwszR6kSu31R5FivOmyuuv5HGWx7vVuii.TR2HlbiqUHnb2KlzsMgqhZpOc3bxngF3ZCb
 cRjUjqmEL8x7NK8_4CuBWKPmJONtXQdP6eEwuDdUqOBPmVdR.7ypGNjMG1VPKsScoWSt.7A5yhmA
 J43kLhp5ahK4mBMGvU4.JR_o3BDIyEiyYpP3hYwKLhNZK.D0iQPAM7a4rtxwY_eo1HUr3NkIaPe6
 hHQJnz4C_f5CUkrRKBS0TnQToQZaHceZkWlXIX2BYt67EZOf7exqrdPpkvFKJNNurrFMativbm7X
 mDXGcmqxGMtQO8p73kIrkugcvVcw6pfCffrhiWGa2CLPDzIwnvPrSrl2Dyz2kYJ2B3sMdkxTAzTw
 UFTNsjiosfnJ.muRTIuR463gJ7tynb1k5Z5DIoLMsfL9dDSAvLUE702q_dBjQWU8z9aajFL6CDHT
 AyvbVuTSdgZq0CN5KRXbBvvj7uy6wbMPnx9VyUWk7NAojM1w6lQZFJI.NUthoUq55vNMf3ue3myr
 uxEPLl7ZoENxjrNGXG3iGP1P3AGS96G_cdX9.huM.nOj6zxwcCPQzm03LSrzYfrEQgc_q.4Sw29h
 jaRgIuE4P6Txfrt7l5y78zYidR5.RsJC8yPOW0qLiXET0L_UkE4635ZZ70R2osfK8SXGb4f2ByOO
 Qiq4qs.nhY69m.8HhZirKOGzF3jnx.Gf54jlYPBvtoaHa3Y4d1avdZEWyd_iXIIuyxNSqS0nXIhl
 R7iNuM0QE6INCccjK5ALf1tW2lGzPRzn.wOCu5ySSbaY25yvW9iWs1bnoHCgOcYtvAC6Ku.9_e.H
 .Fqo8q9u34mG.Ww1bEN.DwwPqGsyEULUCHgDKKNlTqacYTYcagUuCGpVLsrXh3Vd5TNpP2bF_tOu
 N_NsaloNmJi3Fcsoqq46HpiAUjUN0sVCqRQjwQR8i9LDWRTPJv0XeLIdvdb8m8pedbVouWwB8iF5
 Mjiol6S3IovfHEv0DTZh2t6wHqLYaYU62.5LKz9LnUIX5zrxV_a_fhNrSJlEKXOTHfiRsQbRo80z
 QAZV6cXio6GnJdpJ4kCPiTI1mjTSsjTESifKh6OaTfQv6XxQEkTd_8eWqcp39icC4_ZN5Y84J6Gi
 8DNCP5uG8pt.XHkpGgCgH8tIaYmf3oGqfeNRNsXJwKM39QT0VlSQmitMO.GAQgiNj4.MYWZJjSGf
 O1bJiE05RUl6IpfNcgWdLfbcZBBCS8vZ_CJis5oFQSjO3KymQlAYmNw.76xleRyiGZtJHSPx5AG7
 A
Received: from sonic.gate.mail.ne1.yahoo.com by sonic315.consmr.mail.bf2.yahoo.com with HTTP; Wed, 8 Jul 2020 23:43:23 +0000
Date:   Wed, 8 Jul 2020 23:43:20 +0000 (UTC)
From:   Ms lisa Hugh <lisahugh531@gmail.com>
Reply-To: ms.lisahugh000@gmail.com
Message-ID: <538527762.4633085.1594251800761@mail.yahoo.com>
Subject: MASSAGE FROM(Ms Lisa hugh).
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <538527762.4633085.1594251800761.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.16197 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101 Firefox/78.0
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org



Dear Friend,

I am Ms Lisa hugh, work with the department of Audit and accounting manager here in the Bank(B.O.A).

Please i need your assistance for the transferring of thIs fund to your bank account for both of us benefit for life time investment, amount (US$4.5M DOLLARS).

I have every inquiry details to make the bank believe you and release the fund in within 5 banking working days with your full co-operation with me for success.

Note/ 50% for you why 50% for me after success of the transfer to your bank account.

Below information is what i need from you so will can be reaching each other

1)Full name ...
2)Private telephone number...
3)Age...
4)Nationality...
5)Occupation ...


Thanks.

Ms Lisa hugh.
