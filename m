Return-Path: <linux-input-owner@vger.kernel.org>
X-Original-To: lists+linux-input@lfdr.de
Delivered-To: lists+linux-input@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C9BEC18902E
	for <lists+linux-input@lfdr.de>; Tue, 17 Mar 2020 22:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgCQVPE (ORCPT <rfc822;lists+linux-input@lfdr.de>);
        Tue, 17 Mar 2020 17:15:04 -0400
Received: from sonic309-14.consmr.mail.bf2.yahoo.com ([74.6.129.124]:38134
        "EHLO sonic309-14.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726721AbgCQVPE (ORCPT
        <rfc822;linux-input@vger.kernel.org>);
        Tue, 17 Mar 2020 17:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1584479703; bh=iacnFiNuwClBuBYRq2lTmctydZVIx7u3n0jKyEZOUEk=; h=Date:From:Reply-To:Subject:References:From:Subject; b=oR/UJi0Xutm6qDaEsolFe9dqGRGgP46ffj47iDChOuAJ80fHPD6v/EGeCalwoPPI8evYkVJdGd0GfwcSFBXHKrnUbRE1YJNlnAJFsMDSMCc9uvsMbmweNqwSQf0RJbYeIAb1im0oZ1wI5BLVh9fhVO83USlIaVIyTMmLfHLfXWFjYtz5iye2MxBlT0J/GlXQx3sNd3te9SkC1lGEscGfWEAC9PHyNwW4kiWecmKYMsWIuoJ6Zqf29bjuhgqHlmxSshYTZaYDP2tIPwXKw5pEPXN5L4dxaMZpSR+KMh6mN68PJoFTto7L8PkDymdI2ntxykmkDpVBW8NM/cKElmzdrw==
X-YMail-OSG: xbYHLmIVM1nSM.dgg1Gh9OfDr9.M_NBuiIiEX5v8_wHr1Y8lnq_gtKMnNQAG1.o
 WjF_Tb7fs6MwEGENqE4jekVqFI3T07WwM8dWNLp2n5fQEMKLssD4uE9Qm0XcttOD675rjh5.SICB
 FZAHtVdVLEgVkq34gEtX_87WgN7edDPdf7SR.dYKAeFn6fH9vtgqh_pqdip8jojTLcpbcR59kbbt
 eeeM5xQQ7xTL3kssyhoVeZfdgqM1yFOhB5ySry1KOd9A8oxzyaZ.cw7rsMOklGPl479ewJLtxLd6
 ksfUuGKhTYgcf2l5JfUtJ6TWFpHooOftcM_KNSKNz8AkCdi5oYB5juwi6TsC_ZDG9YM_VJcsV9An
 RBi78bQdnGRSNAYubzCjd15QFlGknKfCf8qU_Xj3FR9OXBipBADtRsdoimRMgfsEb7PI5SEOGyop
 3M26uetCYApvLnX03G4lcR9PN9RxEa_g4HYm9CVjswWx5OlMA0i5JFASyi7c0CDBzHPZriiLlmNY
 RwUTYiwnHch2DvFKYLTqXye_We4fS1wCNIR4aTDysEtK01fvQvHQ47X_KxudvYfPH_ACFkho0o_N
 6bvuBy66Vp5FdQ0nUigL.llxm5igQIJGHLwQFd3tQBU.UNDVea61uqU9UH05CYV7r.6oRfHfIfOF
 9s6VYo9TQ_EH8Fp4OOYQ2BcaviY2_rYQE3v09L_KBhKzhY5m3JjzNbvV2AFteb3XNKmkpLBYdjir
 BiYdjd_3yTIYCdKpGB4Z6LGFRl1oeA5ljF9Y2RgimFGSGEphgEWP9WliRu7wz2YmTmaniWUidKKF
 1U2fCUQT7qEQtNQMvssBc0QvGRIut33hPYAG0eMx5cNRJz1T8l714vWpJpeR_U0qxFFtgngWDCY0
 Nc8PEm9HLeLlp9j3ppPiJ9DgAE5HXoha2WvX1NF7sU4e5wslyHYqtjLSAHnxNThtxZ_CuBJYZiJU
 FNQORJUL_3ndk2YRWIjHuA8_TunpcMHGSzTOUGJVh2zaADNtqyWRC3FQuKfXjeO_1qpDSQI_fDZE
 S3KNq2fteMLPD.8J7ZTSIl3ZWjo2OahDWRrD84xyE6Q90PCkruXnybAyYYZL3q0NBi57pxWVwyTa
 Np6lV_ohROV..lrLhs89ddSKS.Rr_N8RxPhpgDucJTTUoU6vH8mkOX9Xboc18.02dFAlJT34_Hqw
 3VuvuLjSVJDtM05GozQU8ZD5FtCuKPOAcK0d4rxIz.YLHHEGti_1Y01Ag_WxrKnx7jdl.Of3M9WL
 3Pg_DjHL_NRiDP6YCJDRxhXRYgwKHNHeOQAMEVcr7uo3N0eG1Wu7InN59pe4D.cvxGPa9kXOZ5w-
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Tue, 17 Mar 2020 21:15:03 +0000
Date:   Tue, 17 Mar 2020 21:15:00 +0000 (UTC)
From:   ABDUL MAJID <majidabdul55@aol.com>
Reply-To: majidabdul70@aol.com
Message-ID: <1236760702.4331577.1584479700866@mail.yahoo.com>
Subject: Hello Dear.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1236760702.4331577.1584479700866.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15342 YMailNodin Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-input-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-input.vger.kernel.org>
X-Mailing-List: linux-input@vger.kernel.org

DR.ABDUL MAJID
AUDITING AND ACCOUNTING MANAGER,
AFRICAN DEVELOPMENT BANK
50-54 RUE DE THOMPSON,
OUAGADOUGOU, BURKINA FASO, WEST AFRICA
 
Dear Friend,
 
Greetings and how are you doing?
 
I want you to be my partner in the transfer of the sum of $38.6
Million dollars discovered in my department in a Bank here in West
Africa and I will give you more details on this when I get your reply
but be rest assured that I will give you 40% of the total sum once the
transfer is completed but you have to maintain secrecy of this deal if
you are ready to work with me.
 
Yours Sincerely,
 
Dr.Abdul Majid
Auditing and Accounting Manager.
